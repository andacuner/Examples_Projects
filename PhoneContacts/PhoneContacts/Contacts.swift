//
//  Contacts.swift
//  PhoneContacts
//
//  Created by Andacuner on 13.06.2022.
//

import Foundation

 import ContactsUI

class PhoneContacts {
    
    static var shared = PhoneContacts()
    
    var duplicateContacts = Dictionary<String,[CNContact]>()
    var duplicatePhoneNumbers = Dictionary<String,[CNContact]>()
    var duplicateMails = Dictionary<String,[CNContact]>()
    var duplicateNameContacts = Dictionary<String,[CNContact]>()
    var organizationName = Dictionary<String,[CNContact]>()
    var jobTitleGroup = Dictionary<String,[CNContact]>()
    var birthdayGroup = Dictionary<String,[CNContact]>()
    
    var withoutPhoneNumber:[CNContact] = []
    var withoutName:[CNContact] = []
    var withoutNameEmail:[CNContact] = []
    var allContainerss: [CNContainer] = []
    var bookType:[ContactsType] = []
    func fetchContainer(container:CNContainer) -> [CNContact] {
        
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactOrganizationNameKey,
            CNContactBirthdayKey,
            CNContactJobTitleKey,
            CNContactImageDataKey,
            CNContainerIdentifierKey,
            CNContactFamilyNameKey,
            CNContactUrlAddressesKey,
            CNContactPostalAddressesKey,
            CNContactViewController.descriptorForRequiredKeys(),
            CNContactThumbnailImageDataKey] as [Any]
        
        let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
        let containerResults = try! contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
        
        return containerResults
    }
    class func getContacts(filter: ContactsFilter = .none) -> [CNContact] { //  ContactsFilter is Enum find it below

        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactOrganizationNameKey,
            CNContactBirthdayKey,
            CNContactJobTitleKey,
            CNContactImageDataKey,
            CNContainerIdentifierKey,
            CNContactViewController.descriptorForRequiredKeys(),
            CNContactThumbnailImageDataKey] as [Any]

        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        PhoneContacts.shared.bookType.removeAll()
        var results: [CNContact] = []
        PhoneContacts.shared.allContainerss.removeAll()
        for container in allContainers {
            
            
            
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            PhoneContacts.shared.allContainerss.append(container)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
                
                var hasItem  = false
                var itemIndex = -1
                for (index,item) in PhoneContacts.shared.bookType.enumerated() {
                    
                    if container.type == item.type {
                        hasItem = true
                        itemIndex = index
                        break
                    }
                    
                }
                if hasItem {
                    
                    PhoneContacts.shared.bookType[itemIndex].contacts.append(contentsOf: containerResults)
                    
                } else {
                    
                    PhoneContacts.shared.bookType.append(ContactsType(type: container.type, contacts: containerResults,container: container))
                    
                }
                
                
            } catch {
                print("Error fetching containers")
            }
        }
        PhoneContacts.shared.withoutName.removeAll()
        PhoneContacts.shared.withoutNameEmail.removeAll()
        PhoneContacts.shared.withoutPhoneNumber.removeAll()
        for item in results {
            
            if item.phoneNumbers.isEmpty {
                PhoneContacts.shared.withoutPhoneNumber.append(item)
            }
            if item.givenName.isEmpty {
                PhoneContacts.shared.withoutName.append(item)
            }
            if item.givenName.isEmpty && item.emailAddresses.isEmpty {
                PhoneContacts.shared.withoutNameEmail.append(item)
            }
            
        }
        let fst = DateFormatter()
        fst.dateFormat = "dd.mm.yyyy"
        
        PhoneContacts.shared.duplicateContacts = Dictionary(grouping: results, by: {$0.givenName}).filter { $1.count > 1 }
        PhoneContacts.shared.organizationName = Dictionary(grouping: results, by: {$0.organizationName}).filter { !$0.key.isEmpty }
        PhoneContacts.shared.jobTitleGroup = Dictionary(grouping: results, by: {$0.jobTitle}).filter { !$0.key.isEmpty }
        PhoneContacts.shared.birthdayGroup = Dictionary(grouping: results, by: {fst.string(from: $0.birthday?.date ?? Date())}).filter { $0.key != fst.string(from:Date()) }
        PhoneContacts.shared.duplicateMails = Dictionary(grouping: results, by: {($0.emailAddresses.first?.value.description ?? "")}).filter { $1.count > 1 && !$0.isEmpty }
        PhoneContacts.shared.duplicateNameContacts = Dictionary(grouping: results, by: {($0.givenName)}).filter { $1.count > 1 && !$0.isEmpty && $1.ifContains(name: $0)  }
        PhoneContacts.shared.duplicatePhoneNumbers = Dictionary(grouping: results, by: {($0.phoneNumbers.first?.value.description ?? "")}).filter { $1.count > 1 && !$0.isEmpty }
        
        return results
    }
}
enum ContactsFilter {
        case none
        case mail
        case message
    }
class PhoneContact: NSObject {

    var name: String?
    var avatarData: Data?
    var phoneNumber: [String] = [String]()
    var email: [String] = [String]()
    var isSelected: Bool = false
    var isInvited = false

    init(contact: CNContact) {
        name        = contact.givenName + " " + contact.familyName
        avatarData  = contact.thumbnailImageData
        for phone in contact.phoneNumbers {
            phoneNumber.append(phone.value.stringValue)
        }
        for mail in contact.emailAddresses {
            email.append(mail.value as String)
        }
    }

    override init() {
        super.init()
    }
}
struct ContactsType {
    
    var type:CNContainerType!
    var contacts:[CNContact] = []
    var container:CNContainer!
    
}
extension Array {
    
    func ifContains(name:String) -> Bool {
        
        for item in self as! [CNContact] {
            
            if item.givenName.contains(name) {
                return true
            }
            
        }
        return false
        
    }
    
}
