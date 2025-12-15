/// Module for [FormSubmissionRequest] class
module webkit.form_submission_request;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Represents a form submission request.
    
    When a form is about to be submitted in a #WebKitWebView, the
    #WebKitWebView::submit-form signal is emitted. Its request argument
    contains information about the text fields of the form, that are
    typically used to store login information, returned as lists by
    [webkit.form_submission_request.FormSubmissionRequest.listTextFields]. You can submit the
    form with [webkit.form_submission_request.FormSubmissionRequest.submit].
*/
class FormSubmissionRequest : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_form_submission_request_get_type != &gidSymbolNotFound ? webkit_form_submission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FormSubmissionRequest self()
  {
    return this;
  }

  /**
      Get lists of the text fields contained in the form associated to request.
      
      Get lists with the names and values of the text fields contained in
      the form associated to request. Note that names and values may be
      null.
      
      If this function returns false, then both field_names and
      field_values will be empty.
  
      Params:
        fieldNames = names of the text fields in the form
        fieldValues = values of the text fields in the form
      Returns: true if the form contains text fields, or false otherwise
  */
  bool listTextFields(out string[] fieldNames, out string[] fieldValues)
  {
    bool _retval;
    GPtrArray* _fieldNames;
    GPtrArray* _fieldValues;
    _retval = cast(bool)webkit_form_submission_request_list_text_fields(cast(WebKitFormSubmissionRequest*)this._cPtr, &_fieldNames, &_fieldValues);
    fieldNames = gPtrArrayToD!(string, GidOwnership.None)(_fieldNames);
    fieldValues = gPtrArrayToD!(string, GidOwnership.None)(_fieldValues);
    return _retval;
  }

  /**
      Continue the form submission.
  */
  void submit()
  {
    webkit_form_submission_request_submit(cast(WebKitFormSubmissionRequest*)this._cPtr);
  }
}
