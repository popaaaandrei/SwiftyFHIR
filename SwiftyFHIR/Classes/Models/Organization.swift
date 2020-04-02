//
//  Organization.swift
//  SwiftyFHIR
//
//  Created by Andrei on 22/03/2020.
//  Generated from FHIR 3.0.0.11832

import Foundation


/**
A grouping of people or organizations with a common purpose.

A formally or informally recognized grouping of people or organizations formed for the purpose of achieving some form of
collective action.  Includes companies, institutions, corporations, departments, community groups, healthcare practice
groups, etc.
*/
public struct Organization: ResourceType {
    
    /// ============= ResourceType ======================
    /// Logical id of this artifact.
    public var id: String
    
    /// Resource type
    public var resourceType: String
    
    /// Metadata about the resource.
    public var meta: Meta?
    
    /// Additional content defined by implementations.
    public var `extension`: [Extension]?
    
    /// =================================================
    
	/// Whether the organization's record is still in active use.
	public var active: Bool?
	
	/// An address for the organization.
	public var address: [Address]?
	
	/// A list of alternate names that the organization is known as, or was known as in the past.
	public var alias: [String]?
	
	/// Contact for the organization for a certain purpose.
	public var contact: [OrganizationContact]?
	
	/// Technical endpoints providing access to services operated for the organization.
	public var endpoint: [Reference]?
	
	/// Identifies this organization  across multiple systems.
	public var identifier: [Identifier]?
	
	/// Name used for the organization.
	public var name: String?
	
	/// The organization of which this organization forms a part.
	public var partOf: Reference?
	
	/// A contact detail for the organization.
	public var telecom: [ContactPoint]?
	
	/// Kind of organization.
	public var type: [CodeableConcept]?

}


/**
Contact for the organization for a certain purpose.
*/
public struct OrganizationContact: Codable {
	
	/// Visiting or postal addresses for the contact.
	public var address: Address?
	
	/// A name associated with the contact.
	public var name: HumanName?
	
	/// The type of contact.
	public var purpose: CodeableConcept?
	
	/// Contact details (telephone, email, etc.)  for a contact.
	public var telecom: [ContactPoint]?
	
}

