/// Module for [Assistant] class
module gtk.assistant;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    A #GtkAssistant is a widget used to represent a generally complex
    operation splitted in several steps, guiding the user through its
    pages and controlling the page flow to collect the necessary data.
    
    The design of GtkAssistant is that it controls what buttons to show
    and to make sensitive, based on what it knows about the page sequence
    and the [type][GtkAssistantPageType] of each page,
    in addition to state information like the page
    [completion][gtk-assistant-set-page-complete]
    and [committed][gtk-assistant-commit] status.
    
    If you have a case that doesn’t quite fit in #GtkAssistants way of
    handling buttons, you can use the #GTK_ASSISTANT_PAGE_CUSTOM page
    type and handle buttons yourself.
    
    # GtkAssistant as GtkBuildable
    
    The GtkAssistant implementation of the #GtkBuildable interface
    exposes the @action_area as internal children with the name
    “action_area”.
    
    To add pages to an assistant in #GtkBuilder, simply add it as a
    child to the GtkAssistant object, and set its child properties
    as necessary.
    
    # CSS nodes
    
    GtkAssistant has a single CSS node with the name assistant.
*/
class Assistant : gtk.window.Window
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
    return cast(void function())gtk_assistant_get_type != &gidSymbolNotFound ? gtk_assistant_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Assistant self()
  {
    return this;
  }

  /**
      Creates a new #GtkAssistant.
      Returns: a newly created #GtkAssistant
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a widget to the action area of a #GtkAssistant.
  
      Params:
        child = a #GtkWidget
  */
  void addActionWidget(gtk.widget.Widget child)
  {
    gtk_assistant_add_action_widget(cast(GtkAssistant*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Appends a page to the assistant.
  
      Params:
        page = a #GtkWidget
      Returns: the index (starting at 0) of the inserted page
  */
  int appendPage(gtk.widget.Widget page)
  {
    int _retval;
    _retval = gtk_assistant_append_page(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Erases the visited page history so the back button is not
      shown on the current page, and removes the cancel button
      from subsequent pages.
      
      Use this when the information provided up to the current
      page is hereafter deemed permanent and cannot be modified
      or undone. For example, showing a progress page to track
      a long-running, unreversible operation after the user has
      clicked apply on a confirmation page.
  */
  void commit()
  {
    gtk_assistant_commit(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Returns the page number of the current page.
      Returns: The index (starting from 0) of the current
            page in the assistant, or -1 if the assistant has no pages,
            or no current page.
  */
  int getCurrentPage()
  {
    int _retval;
    _retval = gtk_assistant_get_current_page(cast(GtkAssistant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of pages in the assistant
      Returns: the number of pages in the assistant
  */
  int getNPages()
  {
    int _retval;
    _retval = gtk_assistant_get_n_pages(cast(GtkAssistant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the child widget contained in page number page_num.
  
      Params:
        pageNum = the index of a page in the assistant,
              or -1 to get the last page
      Returns: the child widget, or null
            if page_num is out of bounds
  */
  gtk.widget.Widget getNthPage(int pageNum)
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_get_nth_page(cast(GtkAssistant*)this._cPtr, pageNum);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether page is complete.
  
      Params:
        page = a page of assistant
      Returns: true if page is complete.
  */
  bool getPageComplete(gtk.widget.Widget page)
  {
    bool _retval;
    _retval = cast(bool)gtk_assistant_get_page_complete(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets whether page has padding.
  
      Params:
        page = a page of assistant
      Returns: true if page has padding
  */
  bool getPageHasPadding(gtk.widget.Widget page)
  {
    bool _retval;
    _retval = cast(bool)gtk_assistant_get_page_has_padding(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the header image for page.
  
      Params:
        page = a page of assistant
      Returns: the header image for page,
            or null if there’s no header image for the page
  
      Deprecated: Since GTK+ 3.2, a header is no longer shown;
            add your header decoration to the page content instead.
  */
  gdkpixbuf.pixbuf.Pixbuf getPageHeaderImage(gtk.widget.Widget page)
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_assistant_get_page_header_image(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the side image for page.
  
      Params:
        page = a page of assistant
      Returns: the side image for page,
            or null if there’s no side image for the page
  
      Deprecated: Since GTK+ 3.2, sidebar images are not
            shown anymore.
  */
  gdkpixbuf.pixbuf.Pixbuf getPageSideImage(gtk.widget.Widget page)
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_assistant_get_page_side_image(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title for page.
  
      Params:
        page = a page of assistant
      Returns: the title for page
  */
  string getPageTitle(gtk.widget.Widget page)
  {
    const(char)* _cretval;
    _cretval = gtk_assistant_get_page_title(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the page type of page.
  
      Params:
        page = a page of assistant
      Returns: the page type of page
  */
  gtk.types.AssistantPageType getPageType(gtk.widget.Widget page)
  {
    GtkAssistantPageType _cretval;
    _cretval = gtk_assistant_get_page_type(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    gtk.types.AssistantPageType _retval = cast(gtk.types.AssistantPageType)_cretval;
    return _retval;
  }

  /**
      Inserts a page in the assistant at a given position.
  
      Params:
        page = a #GtkWidget
        position = the index (starting at 0) at which to insert the page,
              or -1 to append the page to the assistant
      Returns: the index (starting from 0) of the inserted page
  */
  int insertPage(gtk.widget.Widget page, int position)
  {
    int _retval;
    _retval = gtk_assistant_insert_page(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Navigate to the next page.
      
      It is a programming error to call this function when
      there is no next page.
      
      This function is for use when creating pages of the
      #GTK_ASSISTANT_PAGE_CUSTOM type.
  */
  void nextPage()
  {
    gtk_assistant_next_page(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Prepends a page to the assistant.
  
      Params:
        page = a #GtkWidget
      Returns: the index (starting at 0) of the inserted page
  */
  int prependPage(gtk.widget.Widget page)
  {
    int _retval;
    _retval = gtk_assistant_prepend_page(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Navigate to the previous visited page.
      
      It is a programming error to call this function when
      no previous page is available.
      
      This function is for use when creating pages of the
      #GTK_ASSISTANT_PAGE_CUSTOM type.
  */
  void previousPage()
  {
    gtk_assistant_previous_page(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Removes a widget from the action area of a #GtkAssistant.
  
      Params:
        child = a #GtkWidget
  */
  void removeActionWidget(gtk.widget.Widget child)
  {
    gtk_assistant_remove_action_widget(cast(GtkAssistant*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes the page_num’s page from assistant.
  
      Params:
        pageNum = the index of a page in the assistant,
              or -1 to remove the last page
  */
  void removePage(int pageNum)
  {
    gtk_assistant_remove_page(cast(GtkAssistant*)this._cPtr, pageNum);
  }

  /**
      Switches the page to page_num.
      
      Note that this will only be necessary in custom buttons,
      as the assistant flow can be set with
      [gtk.assistant.Assistant.setForwardPageFunc].
  
      Params:
        pageNum = index of the page to switch to, starting from 0.
              If negative, the last page will be used. If greater
              than the number of pages in the assistant, nothing
              will be done.
  */
  void setCurrentPage(int pageNum)
  {
    gtk_assistant_set_current_page(cast(GtkAssistant*)this._cPtr, pageNum);
  }

  /**
      Sets the page forwarding function to be page_func.
      
      This function will be used to determine what will be
      the next page when the user presses the forward button.
      Setting page_func to null will make the assistant to
      use the default forward function, which just goes to the
      next visible page.
  
      Params:
        pageFunc = the #GtkAssistantPageFunc, or null
              to use the default one
  */
  void setForwardPageFunc(gtk.types.AssistantPageFunc pageFunc = null)
  {
    extern(C) int _pageFuncCallback(int currentPage, void* data)
    {
      auto _dlg = cast(gtk.types.AssistantPageFunc*)data;

      int _retval = (*_dlg)(currentPage);
      return _retval;
    }
    auto _pageFuncCB = pageFunc ? &_pageFuncCallback : null;

    auto _pageFunc = pageFunc ? freezeDelegate(cast(void*)&pageFunc) : null;
    GDestroyNotify _pageFuncDestroyCB = pageFunc ? &thawDelegate : null;
    gtk_assistant_set_forward_page_func(cast(GtkAssistant*)this._cPtr, _pageFuncCB, _pageFunc, _pageFuncDestroyCB);
  }

  /**
      Sets whether page contents are complete.
      
      This will make assistant update the buttons state
      to be able to continue the task.
  
      Params:
        page = a page of assistant
        complete = the completeness status of the page
  */
  void setPageComplete(gtk.widget.Widget page, bool complete)
  {
    gtk_assistant_set_page_complete(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, complete);
  }

  /**
      Sets whether the assistant is adding padding around
      the page.
  
      Params:
        page = a page of assistant
        hasPadding = whether this page has padding
  */
  void setPageHasPadding(gtk.widget.Widget page, bool hasPadding)
  {
    gtk_assistant_set_page_has_padding(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, hasPadding);
  }

  /**
      Sets a header image for page.
  
      Params:
        page = a page of assistant
        pixbuf = the new header image page
  
      Deprecated: Since GTK+ 3.2, a header is no longer shown;
            add your header decoration to the page content instead.
  */
  void setPageHeaderImage(gtk.widget.Widget page, gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_assistant_set_page_header_image(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets a side image for page.
      
      This image used to be displayed in the side area of the assistant
      when page is the current page.
  
      Params:
        page = a page of assistant
        pixbuf = the new side image page
  
      Deprecated: Since GTK+ 3.2, sidebar images are not
            shown anymore.
  */
  void setPageSideImage(gtk.widget.Widget page, gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_assistant_set_page_side_image(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets a title for page.
      
      The title is displayed in the header area of the assistant
      when page is the current page.
  
      Params:
        page = a page of assistant
        title = the new title for page
  */
  void setPageTitle(gtk.widget.Widget page, string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_assistant_set_page_title(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, _title);
  }

  /**
      Sets the page type for page.
      
      The page type determines the page behavior in the assistant.
  
      Params:
        page = a page of assistant
        type = the new type for page
  */
  void setPageType(gtk.widget.Widget page, gtk.types.AssistantPageType type)
  {
    gtk_assistant_set_page_type(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, type);
  }

  /**
      Forces assistant to recompute the buttons state.
      
      GTK+ automatically takes care of this in most situations,
      e.g. when the user goes to a different page, or when the
      visibility or completeness of a page changes.
      
      One situation where it can be necessary to call this
      function is when changing a value on the current page
      affects the future page flow of the assistant.
  */
  void updateButtonsState()
  {
    gtk_assistant_update_buttons_state(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Connect to `Apply` signal.
  
      The ::apply signal is emitted when the apply button is clicked.
      
      The default behavior of the #GtkAssistant is to switch to the page
      after the current page, unless the current page is the last one.
      
      A handler for the ::apply signal should carry out the actions for
      which the wizard has collected data. If the action takes a long time
      to complete, you might consider putting a page of type
      [gtk.types.AssistantPageType.Progress] after the confirmation page and handle
      this operation within the #GtkAssistant::prepare signal of the progress
      page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.assistant.Assistant assistant))
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApply(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("apply", closure, after);
  }

  /**
      Connect to `Cancel` signal.
  
      The ::cancel signal is emitted when then the cancel button is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.assistant.Assistant assistant))
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancel(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel", closure, after);
  }

  /**
      Connect to `Close` signal.
  
      The ::close signal is emitted either when the close button of
      a summary page is clicked, or when the apply button in the last
      page in the flow (of type [gtk.types.AssistantPageType.Confirm]) is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.assistant.Assistant assistant))
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Escape` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.assistant.Assistant assistant))
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEscape(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("escape", closure, after);
  }

  /**
      Connect to `Prepare` signal.
  
      The ::prepare signal is emitted when a new page is set as the
      assistant's current page, before making the new page visible.
      
      A handler for this signal can do any preparations which are
      necessary before showing page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget page, gtk.assistant.Assistant assistant))
  
          `page` the current page (optional)
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPrepare(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.assistant.Assistant)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }
}
