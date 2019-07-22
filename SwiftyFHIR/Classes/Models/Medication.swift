//
//  Medication.swift
//  App
//
//  Created by Andrei on 21/07/2019.
//


import Foundation


/**
🔥🔥🔥🔥🔥🔥🔥🔥🔥 NOT COMPLETE 🔥🔥🔥🔥🔥🔥🔥🔥🔥
Definition of a Medication.

This resource is primarily used for the identification and definition of a medication. It covers the ingredients and the packaging for a medication.
*/

public struct Medication: Codable, ResourceType {
    
    
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
	
	/// Codes that identify this medication.
	public var code: CodeableConcept?
	
	/// powder | tablets | capsule +.
	public var form: CodeableConcept?
	
	/// Picture of the medication.
	public var image: [Attachment]?
	
	/// Active or inactive ingredient.
	public var ingredient: [MedicationIngredient]?
	
	/// True if a brand.
	public var isBrand: Bool?
	
	/// True if medication does not require a prescription.
	public var isOverTheCounter: Bool?
	
	/// Manufacturer of the item.
	public var manufacturer: Reference?
	
	/// Details about packaged medications.
	public var package: MedicationPackage?
	
	/// A code to indicate if the medication is in active use.
	public var status: MedicationStatus?

}


/**
Active or inactive ingredient.

Identifies a particular constituent of interest in the product.
*/
public struct MedicationIngredient: Codable {
	
	/// Quantity of ingredient present.
	public var amount: Ratio?
	
	/// Active ingredient indicator.
	public var isActive: Bool?
	
	/// The product contained.
	public var itemCodeableConcept: CodeableConcept?
	
	/// The product contained.
	public var itemReference: Reference?
    
}


/**
 A ratio of two Quantity values - a numerator and a denominator.
 
 A relationship of two Quantity values - expressed as a numerator and a denominator.
 */
public struct Ratio: Codable {

    /// Denominator value.
    public var denominator: Quantity?
    
    /// Numerator value.
    public var numerator: Quantity?
}


/**
Details about packaged medications.

Information that only applies to packages (not products).
*/
public struct MedicationPackage: Codable {
	
	/// Identifies a single production run.
	public var batch: [MedicationPackageBatch]?
	
	/// E.g. box, vial, blister-pack.
	public var container: CodeableConcept?
	
	/// What is  in the package.
	public var content: [MedicationPackageContent]?

}


/**
Identifies a single production run.

Information about a group of medication produced or packaged from one production run.
*/
public struct MedicationPackageBatch: Codable {
	
	/// When batch will expire.
	public var expirationDate: String?
	
	/// Identifier assigned to batch.
	public var lotNumber: String?
	
}


/**
What is  in the package.

A set of components that go to make up the described item.
*/
public struct MedicationPackageContent: Codable {
	
	/// Quantity present in the package.
	public var amount: Quantity?
	
	/// The item in the package.
	public var itemCodeableConcept: CodeableConcept?
	
	/// The item in the package.
	public var itemReference: Reference?

}

