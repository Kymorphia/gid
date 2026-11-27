/// Module for [Assistant] class
module gid.gtk4.assistant;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.assistant_page;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.gtk4.window;

/**
    [gid.gtk4.assistant.Assistant] is used to represent a complex as a series of steps.
    
    <picture>
      <source srcset="assistant-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkAssistant" src="assistant.png">
    </picture>
    
    Each step consists of one or more pages. [gid.gtk4.assistant.Assistant] guides the user
    through the pages, and controls the page flow to collect the data needed
    for the operation.
    
    [gid.gtk4.assistant.Assistant] handles which buttons to show and to make sensitive based
    on page sequence knowledge and the [gid.gtk4.types.AssistantPageType] of each
    page in addition to state information like the *completed* and *committed*
    page statuses.
    
    If you have a case that doesn’t quite fit in [gid.gtk4.assistant.Assistant]s way of
    handling buttons, you can use the [gid.gtk4.types.AssistantPageType.Custom] page
    type and handle buttons yourself.
    
    [gid.gtk4.assistant.Assistant] maintains a [gid.gtk4.assistant_page.AssistantPage] object for each added
    child, which holds additional per-child properties. You
    obtain the [gid.gtk4.assistant_page.AssistantPage] for a child with [gid.gtk4.assistant.Assistant.getPage].
    
    # GtkAssistant as GtkBuildable
    
    The [gid.gtk4.assistant.Assistant] implementation of the [gid.gtk4.buildable.Buildable] interface
    exposes the @action_area as internal children with the name
    “action_area”.
    
    To add pages to an assistant in [gid.gtk4.builder.Builder], simply add it as a
    child to the [gid.gtk4.assistant.Assistant] object. If you need to set per-object
    properties, create a [gid.gtk4.assistant_page.AssistantPage] object explicitly, and
    set the child widget as a property on it.
    
    # CSS nodes
    
    [gid.gtk4.assistant.Assistant] has a single CSS node with the name window and style
    class .assistant.

    Deprecated: This widget will be removed in GTK 5
*/
@gidGir("Assistant")
class Assistant : gid.gtk4.window.Window
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
    return cast(void function())gtk_assistant_get_type != &gidSymbolNotFound ? gtk_assistant_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAssistant";
  }

  /** Returns `this`, for use in `with` statements. */
  override Assistant self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.assistant.Assistant]
      Returns: New builder object
  */
  static AssistantGidBuilder builder() nothrow
  {
    return new AssistantGidBuilder;
  }

  /**
      Get `pages` property.
      Returns: [gid.gio2.list_model.ListModel] containing the pages.
  */
  @property gid.gio2.list_model.ListModel pages() nothrow
  {
    return getPages();
  }

  /**
      Get `useHeaderBar` property.
      Returns: true if the assistant uses a [gid.gtk4.header_bar.HeaderBar] for action buttons
        instead of the action-area.
        
        For technical reasons, this property is declared as an integer
        property, but you should only set it to true or false.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property int useHeaderBar() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("use-header-bar");
  }

  /**
      Creates a new [gid.gtk4.assistant.Assistant].
      Returns: a newly created [gid.gtk4.assistant.Assistant]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_assistant_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a widget to the action area of a [gid.gtk4.assistant.Assistant].
  
      Params:
        child = a [gid.gtk4.widget.Widget]
  
      Deprecated: This widget will be removed in GTK 5
  */
  void addActionWidget(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_assistant_add_action_widget(cast(GtkAssistant*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Appends a page to the assistant.
  
      Params:
        page = a [gid.gtk4.widget.Widget]
      Returns: the index (starting at 0) of the inserted page
  
      Deprecated: This widget will be removed in GTK 5
  */
  int appendPage(gid.gtk4.widget.Widget page) nothrow
  {
    int _retval;
    _retval = gtk_assistant_append_page(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Erases the visited page history.
      
      GTK will then hide the back button on the current page,
      and removes the cancel button from subsequent pages.
      
      Use this when the information provided up to the current
      page is hereafter deemed permanent and cannot be modified
      or undone. For example, showing a progress page to track
      a long-running, unreversible operation after the user has
      clicked apply on a confirmation page.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void commit() nothrow
  {
    gtk_assistant_commit(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Returns the page number of the current page.
      Returns: The index (starting from 0) of the current
          page in the assistant, or -1 if the assistant has no pages,
          or no current page
  
      Deprecated: This widget will be removed in GTK 5
  */
  int getCurrentPage() nothrow
  {
    int _retval;
    _retval = gtk_assistant_get_current_page(cast(GtkAssistant*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of pages in the assistant
      Returns: the number of pages in the assistant
  
      Deprecated: This widget will be removed in GTK 5
  */
  int getNPages() nothrow
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
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gtk4.widget.Widget getNthPage(int pageNum) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_get_nth_page(cast(GtkAssistant*)this._cPtr, pageNum);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gid.gtk4.assistant_page.AssistantPage] object for child.
  
      Params:
        child = a child of assistant
      Returns: the [gid.gtk4.assistant_page.AssistantPage] for child
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gtk4.assistant_page.AssistantPage getPage(gid.gtk4.widget.Widget child) nothrow
  {
    GtkAssistantPage* _cretval;
    _cretval = gtk_assistant_get_page(cast(GtkAssistant*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.assistant_page.AssistantPage)(cast(GtkAssistantPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether page is complete.
  
      Params:
        page = a page of assistant
      Returns: true if page is complete.
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getPageComplete(gid.gtk4.widget.Widget page) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_assistant_get_page_complete(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the title for page.
  
      Params:
        page = a page of assistant
      Returns: the title for page
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getPageTitle(gid.gtk4.widget.Widget page) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_assistant_get_page_title(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the page type of page.
  
      Params:
        page = a page of assistant
      Returns: the page type of page
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gtk4.types.AssistantPageType getPageType(gid.gtk4.widget.Widget page) nothrow
  {
    GtkAssistantPageType _cretval;
    _cretval = gtk_assistant_get_page_type(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null);
    gid.gtk4.types.AssistantPageType _retval = cast(gid.gtk4.types.AssistantPageType)_cretval;
    return _retval;
  }

  /**
      Gets a list model of the assistant pages.
      Returns: A list model of the pages.
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gio2.list_model.ListModel getPages() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_assistant_get_pages(cast(GtkAssistant*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Inserts a page in the assistant at a given position.
  
      Params:
        page = a [gid.gtk4.widget.Widget]
        position = the index (starting at 0) at which to insert the page,
            or -1 to append the page to the assistant
      Returns: the index (starting from 0) of the inserted page
  
      Deprecated: This widget will be removed in GTK 5
  */
  int insertPage(gid.gtk4.widget.Widget page, int position) nothrow
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
      [gid.gtk4.types.AssistantPageType.Custom] type.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void nextPage() nothrow
  {
    gtk_assistant_next_page(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Prepends a page to the assistant.
  
      Params:
        page = a [gid.gtk4.widget.Widget]
      Returns: the index (starting at 0) of the inserted page
  
      Deprecated: This widget will be removed in GTK 5
  */
  int prependPage(gid.gtk4.widget.Widget page) nothrow
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
      [gid.gtk4.types.AssistantPageType.Custom] type.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void previousPage() nothrow
  {
    gtk_assistant_previous_page(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Removes a widget from the action area of a [gid.gtk4.assistant.Assistant].
  
      Params:
        child = a [gid.gtk4.widget.Widget]
  
      Deprecated: This widget will be removed in GTK 5
  */
  void removeActionWidget(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_assistant_remove_action_widget(cast(GtkAssistant*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes the page_num’s page from assistant.
  
      Params:
        pageNum = the index of a page in the assistant,
            or -1 to remove the last page
  
      Deprecated: This widget will be removed in GTK 5
  */
  void removePage(int pageNum) nothrow
  {
    gtk_assistant_remove_page(cast(GtkAssistant*)this._cPtr, pageNum);
  }

  /**
      Switches the page to page_num.
      
      Note that this will only be necessary in custom buttons,
      as the assistant flow can be set with
      [gid.gtk4.assistant.Assistant.setForwardPageFunc].
  
      Params:
        pageNum = index of the page to switch to, starting from 0.
            If negative, the last page will be used. If greater
            than the number of pages in the assistant, nothing
            will be done.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setCurrentPage(int pageNum) nothrow
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
        pageFunc = the [gid.gtk4.types.AssistantPageFunc], or null
            to use the default one
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setForwardPageFunc(gid.gtk4.types.AssistantPageFunc pageFunc = null) nothrow
  {
    extern(C) int _pageFuncCallback(int currentPage, void* data) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk4.types.AssistantPageFunc*)data;

      try
      {
        _retval = (*_dlg)(currentPage);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.AssistantPageFunc");
      }
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
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setPageComplete(gid.gtk4.widget.Widget page, bool complete) nothrow
  {
    gtk_assistant_set_page_complete(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, complete);
  }

  /**
      Sets a title for page.
      
      The title is displayed in the header area of the assistant
      when page is the current page.
  
      Params:
        page = a page of assistant
        title = the new title for page
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setPageTitle(gid.gtk4.widget.Widget page, string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_assistant_set_page_title(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, _title);
  }

  /**
      Sets the page type for page.
      
      The page type determines the page behavior in the assistant.
  
      Params:
        page = a page of assistant
        type = the new type for page
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setPageType(gid.gtk4.widget.Widget page, gid.gtk4.types.AssistantPageType type) nothrow
  {
    gtk_assistant_set_page_type(cast(GtkAssistant*)this._cPtr, page ? cast(GtkWidget*)page._cPtr(No.Dup) : null, type);
  }

  /**
      Forces assistant to recompute the buttons state.
      
      GTK automatically takes care of this in most situations,
      e.g. when the user goes to a different page, or when the
      visibility or completeness of a page changes.
      
      One situation where it can be necessary to call this
      function is when changing a value on the current page
      affects the future page flow of the assistant.
  
      Deprecated: This widget will be removed in GTK 5
  */
  void updateButtonsState() nothrow
  {
    gtk_assistant_update_buttons_state(cast(GtkAssistant*)this._cPtr);
  }

  /**
      Connect to `Apply` signal.
  
      Emitted when the apply button is clicked.
        
        The default behavior of the [gid.gtk4.assistant.Assistant] is to switch to the page
        after the current page, unless the current page is the last one.
        
        A handler for the ::apply signal should carry out the actions for
        which the wizard has collected data. If the action takes a long time
        to complete, you might consider putting a page of type
        [gid.gtk4.types.AssistantPageType.Progress] after the confirmation page and handle
        this operation within the [gid.gtk4.assistant.Assistant.prepare] signal of
        the progress page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.assistant.Assistant assistant)`
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectApply(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.assistant.Assistant.apply");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("apply", closure, after);
  }

  /**
      Connect to `Cancel` signal.
  
      Emitted when then the cancel button is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.assistant.Assistant assistant)`
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectCancel(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.assistant.Assistant.cancel");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel", closure, after);
  }

  /**
      Connect to `Close` signal.
  
      Emitted either when the close button of a summary page is clicked,
        or when the apply button in the last page in the flow (of type
        [gid.gtk4.types.AssistantPageType.Confirm]) is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.assistant.Assistant assistant)`
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectClose(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.assistant.Assistant.close");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Escape` signal.
  
      The action signal for the Escape binding.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.assistant.Assistant assistant)`
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectEscape(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.assistant.Assistant)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.assistant.Assistant.escape");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("escape", closure, after);
  }

  /**
      Connect to `Prepare` signal.
  
      Emitted when a new page is set as the assistant's current page,
        before making the new page visible.
        
        A handler for this signal can do any preparations which are
        necessary before showing page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget page, gid.gtk4.assistant.Assistant assistant)`
  
          `page` the current page (optional)
  
          `assistant` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectPrepare(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.assistant.Assistant)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.assistant.Assistant.prepare");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.assistant.Assistant]
class AssistantGidBuilderImpl(T) : gid.gtk4.window.WindowGidBuilderImpl!T
{


  /**
      Set `useHeaderBar` property.
      Params:
        propval = true if the assistant uses a [gid.gtk4.header_bar.HeaderBar] for action buttons
          instead of the action-area.
          
          For technical reasons, this property is declared as an integer
          property, but you should only set it to true or false.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T useHeaderBar(int propval) nothrow
  {
    return setProperty("use-header-bar", propval);
  }
}

/// Fluent builder for [gid.gtk4.assistant.Assistant]
final class AssistantGidBuilder : AssistantGidBuilderImpl!AssistantGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Assistant build() nothrow
  {
    return new Assistant(cast(void*)createGObject(Assistant._getGType), Yes.Take);
  }
}
