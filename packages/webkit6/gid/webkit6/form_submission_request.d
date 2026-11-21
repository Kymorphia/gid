/// Module for [FormSubmissionRequest] class
module gid.webkit6.form_submission_request;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Represents a form submission request.
    
    When a form is about to be submitted in a #WebKitWebView, the
    #WebKitWebView::submit-form signal is emitted. Its request argument
    contains information about the text fields of the form, that are
    typically used to store login information, returned as lists by
    [gid.webkit6.form_submission_request.FormSubmissionRequest.listTextFields]. You can submit the
    form with [gid.webkit6.form_submission_request.FormSubmissionRequest.submit].
*/
class FormSubmissionRequest : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_form_submission_request_get_type != &gidSymbolNotFound ? webkit_form_submission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitFormSubmissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override FormSubmissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.form_submission_request.FormSubmissionRequest]
      Returns: New builder object
  */
  static FormSubmissionRequestGidBuilder builder() nothrow
  {
    return new FormSubmissionRequestGidBuilder;
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
  bool listTextFields(out string[] fieldNames, out string[] fieldValues) nothrow
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
  void submit() nothrow
  {
    webkit_form_submission_request_submit(cast(WebKitFormSubmissionRequest*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.webkit6.form_submission_request.FormSubmissionRequest]
class FormSubmissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.form_submission_request.FormSubmissionRequest]
final class FormSubmissionRequestGidBuilder : FormSubmissionRequestGidBuilderImpl!FormSubmissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FormSubmissionRequest build() nothrow
  {
    return new FormSubmissionRequest(cast(void*)createGObject(FormSubmissionRequest._getGType), Yes.Take);
  }
}
