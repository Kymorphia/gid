/// Module for [FileChooserRequest] class
module webkit.file_chooser_request;

import gid.gid;
import gobject.object;
import gtk.file_filter;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A request to open a file chooser.
    
    Whenever the user interacts with an HTML input element with
    file type, WebKit will need to show a dialog to choose one or
    more files to be uploaded to the server along with the rest of the
    form data. For that to happen in a general way, instead of just
    opening a #GtkFileChooserDialog (which might be not desirable in
    some cases, which could prefer to use their own file chooser
    dialog), WebKit will fire the #WebKitWebView::run-file-chooser
    signal with a #WebKitFileChooserRequest object, which will allow
    the client application to specify the files to be selected, to
    inspect the details of the request (e.g. if multiple selection
    should be allowed) and to cancel the request, in case nothing was
    selected.
    
    In case the client application does not wish to handle this signal,
    WebKit will provide a default handler which will asynchronously run
    a regular #GtkFileChooserDialog for the user to interact with.
*/
class FileChooserRequest : gobject.object.ObjectWrap
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
    return cast(void function())webkit_file_chooser_request_get_type != &gidSymbolNotFound ? webkit_file_chooser_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserRequest self()
  {
    return this;
  }

  /**
      Get `filter` property.
      Returns: The filter currently associated with the request. See
        [webkit.file_chooser_request.FileChooserRequest.getMimeTypesFilter] for more
        details.
  */
  @property gtk.file_filter.FileFilter filter()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.file_filter.FileFilter)("filter");
  }

  /**
      Get `selectMultiple` property.
      Returns: Whether the file chooser should allow selecting multiple
        files. See
        [webkit.file_chooser_request.FileChooserRequest.getSelectMultiple] for
        more details.
  */
  @property bool selectMultiple()
  {
    return getSelectMultiple();
  }

  /**
      Ask WebKit to cancel the request.
      
      It's important to do this in case
      no selection has been made in the client, otherwise the request
      won't be properly completed and the browser will keep the request
      pending forever, which might cause the browser to hang.
  */
  void cancel()
  {
    webkit_file_chooser_request_cancel(cast(WebKitFileChooserRequest*)this._cPtr);
  }

  /**
      Get the list of MIME types the file chooser dialog should handle.
      
      Get the list of MIME types the file chooser dialog should handle,
      in the format specified in RFC 2046 for "media types". Its contents
      depend on the value of the 'accept' attribute for HTML input
      elements. This function should normally be called before presenting
      the file chooser dialog to the user, to decide whether to allow the
      user to select multiple files at once or only one.
      Returns: a
        null-terminated array of strings if a list of accepted MIME types
        is defined or null otherwise, meaning that any MIME type should be
        accepted. This array and its contents are owned by WebKit and
        should not be modified or freed.
  */
  string[] getMimeTypes()
  {
    const(char*)* _cretval;
    _cretval = webkit_file_chooser_request_get_mime_types(cast(WebKitFileChooserRequest*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Get the filter currently associated with the request.
      
      Get the filter currently associated with the request, ready to be
      used by #GtkFileChooser. This function should normally be called
      before presenting the file chooser dialog to the user, to decide
      whether to apply a filter so the user would not be allowed to
      select files with other MIME types.
      
      See [webkit.file_chooser_request.FileChooserRequest.getMimeTypes] if you are
      interested in getting the list of accepted MIME types.
      Returns: a #GtkFileFilter if a list of accepted
        MIME types is defined or null otherwise. The returned object is
        owned by WebKit should not be modified or freed.
  */
  gtk.file_filter.FileFilter getMimeTypesFilter()
  {
    GtkFileFilter* _cretval;
    _cretval = webkit_file_chooser_request_get_mime_types_filter(cast(WebKitFileChooserRequest*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Whether the file chooser should allow selecting multiple files.
      
      Determine whether the file chooser associated to this
      #WebKitFileChooserRequest should allow selecting multiple files,
      which depends on the HTML input element having a 'multiple'
      attribute defined.
      Returns: true if the file chooser should allow selecting multiple files or false otherwise.
  */
  bool getSelectMultiple()
  {
    bool _retval;
    _retval = cast(bool)webkit_file_chooser_request_get_select_multiple(cast(WebKitFileChooserRequest*)this._cPtr);
    return _retval;
  }

  /**
      Get the list of selected files associated to the request.
      
      Get the list of selected files currently associated to the
      request. Initially, the return value of this method contains any
      files selected in previous file chooser requests for this HTML
      input element. Once webkit_file_chooser_request_select_files, the
      value will reflect whatever files are given.
      
      This function should normally be called only before presenting the
      file chooser dialog to the user, to decide whether to perform some
      extra action, like pre-selecting the files from a previous request.
      Returns: a
        null-terminated array of strings if there are selected files
        associated with the request or null otherwise. This array and its
        contents are owned by WebKit and should not be modified or
        freed.
  */
  string[] getSelectedFiles()
  {
    const(char*)* _cretval;
    _cretval = webkit_file_chooser_request_get_selected_files(cast(WebKitFileChooserRequest*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Ask WebKit to select local files for upload and complete the
      request.
  
      Params:
        files = a
          null-terminated array of strings, containing paths to local files.
  */
  void selectFiles(string[] files)
  {
    char*[] _tmpfiles;
    foreach (s; files)
      _tmpfiles ~= s.toCString(No.Alloc);
    _tmpfiles ~= null;
    const(char*)* _files = _tmpfiles.ptr;

    webkit_file_chooser_request_select_files(cast(WebKitFileChooserRequest*)this._cPtr, _files);
  }
}
