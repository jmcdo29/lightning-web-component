import { reduceErrors } from 'c/ldsUtils';
import { LightningElement, wire } from "lwc";
import FIRST_NAME_FIELD from "@salesforce/schema/Contact.FirstName";
import LAST_NAME_FIELD from "@salesforce/schema/Contact.LastName";
import EMAIL_FIELD from "@salesforce/schema/Contact.Email";
import getContacts from "@salesforce/apex/ContactController.getContacts";
const COLUMNS = [
  {
    label: "Contact First Name",
    fieldName: FIRST_NAME_FIELD.apiFieldName,
    type: "text",
  },
  {
    label: "Contact Last Name",
    fieldName: LAST_NAME_FIELD.apiFieldName,
    type: "text",
  },
  { label: "Contact Email", fieldName: EMAIL_FIELD.apiFieldName, type: "text" },
];

export default class ContactList extends LightningElement {
  columns = COLUMNS;
  @wire(getContacts)
  contacts;

  get errors() {
    return this.contacts.error ? reduceErrors(this.contacts.error) : [];
  }
}
