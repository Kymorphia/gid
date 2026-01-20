/// Module for [VimIMContext] class
module gtksource.vim_imcontext;

import gid.gid;
import gobject.dclosure;
import gtk.imcontext;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
    Vim emulation.
    
    The [gtksource.vim_imcontext.VimIMContext] is a [gtk.imcontext.IMContext] implementation that can
    be used to provide Vim-like editing controls within a `class@View`.
    
    The `GtkSourceViMIMContext` will process incoming [gdk.key_event.KeyEvent] as the
    user types. It should be used in conjunction with a [gtk.event_controller_key.EventControllerKey].
    
    Various features supported by [gtksource.vim_imcontext.VimIMContext] include:
    
     $(LIST
        * Normal, Insert, Replace, Visual, and Visual Line modes
        * Support for an integrated command bar and current command preview
        * Search and replace
        * Motions and Text Objects
        * History replay
        * Jumplists within the current file
        * Registers including the system and primary clipboards
        * Creation and motion to marks
        * Some commonly used Vim commands
     )
       
    It is recommended that applications display the contents of
    `property@VimIMContext:command-bar-text` and
    `property@VimIMContext:command-text` to the user as they represent the
    command-bar and current command preview found in Vim.
    
    [gtksource.vim_imcontext.VimIMContext] attempts to work with additional [gtk.imcontext.IMContext]
    implementations such as IBus by querying the [gtk.text_view.TextView] before processing
    the command in states which support it (notably Insert and Replace modes).
    
    ```c
    GtkEventController *key;
    GtkIMContext *im_context;
    GtkWidget *view;
    
    view = gtk_source_view_new ();
    im_context = gtk_source_vim_im_context_new ();
    key = gtk_event_controller_key_new ();
    
    gtk_event_controller_key_set_im_context (GTK_EVENT_CONTROLLER_KEY (key), im_context);
    gtk_event_controller_set_propagation_phase (key, GTK_PHASE_CAPTURE);
    gtk_widget_add_controller (view, key);
    gtk_im_context_set_client_widget (im_context, view);
    
    g_object_bind_property (im_context, "command-bar-text", command_bar_label, "label", 0);
    g_object_bind_property (im_context, "command-text", command_label, "label", 0);
    ```
*/
class VimIMContext : gtk.imcontext.IMContext
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
    return cast(void function())gtk_source_vim_im_context_get_type != &gidSymbolNotFound ? gtk_source_vim_im_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VimIMContext self()
  {
    return this;
  }

  /** */
  @property string commandBarText()
  {
    return getCommandBarText();
  }

  /** */
  @property string commandText()
  {
    return getCommandText();
  }

  /** */
  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_source_vim_im_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Executes command as if it was typed into the command bar by the
      user except that this does not emit the
      `signalVimIMContext::execute-command` signal.
  
      Params:
        command = the command text
  */
  void executeCommand(string command)
  {
    const(char)* _command = command.toCString(No.Alloc);
    gtk_source_vim_im_context_execute_command(cast(GtkSourceVimIMContext*)this._cPtr, _command);
  }

  /**
      Gets the current command-bar text as it is entered by the user.
      Returns: A string containing the command-bar text
  */
  string getCommandBarText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_vim_im_context_get_command_bar_text(cast(GtkSourceVimIMContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the current command text as it is entered by the user.
      Returns: A string containing the command text
  */
  string getCommandText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_vim_im_context_get_command_text(cast(GtkSourceVimIMContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Connect to `Edit` signal.
  
      Requests the application open the file found at path.
        
        If path is null, then the current file should be reloaded from storage.
        
        This may be executed in relation to the user running the
        `:edit` or `:e` commands.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.view.View view, string path, gtksource.vim_imcontext.VimIMContext vimIMContext))
  
          `view` the #GtkSourceView (optional)
  
          `path` the path if provided, otherwise null (optional)
  
          `vimIMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEdit(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.view.View)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.vim_imcontext.VimIMContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edit", closure, after);
  }

  /**
      Connect to `ExecuteCommand` signal.
  
      The signal is emitted when a command should be
        executed. This might be something like `:wq` or `:e <path>`.
        
        If the application chooses to implement this, it should return
        true from this signal to indicate the command has been handled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(string command, gtksource.vim_imcontext.VimIMContext vimIMContext))
  
          `command` the command to execute (optional)
  
          `vimIMContext` the instance the signal is connected to (optional)
  
          `Returns` true if handled; otherwise false.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectExecuteCommand(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtksource.vim_imcontext.VimIMContext)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("execute-command", closure, after);
  }

  /**
      Connect to `FormatText` signal.
  
      Requests that the application format the text between
        begin and end.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter begin, gtk.text_iter.TextIter end, gtksource.vim_imcontext.VimIMContext vimIMContext))
  
          `begin` the start location (optional)
  
          `end` the end location (optional)
  
          `vimIMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFormatText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.vim_imcontext.VimIMContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("format-text", closure, after);
  }

  /**
      Connect to `Write` signal.
  
      Requests the application save the file.
        
        If a filename was provided, it will be available to the signal handler as path.
        This may be executed in relation to the user running the `:write` or `:w` commands.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.view.View view, string path, gtksource.vim_imcontext.VimIMContext vimIMContext))
  
          `view` the #GtkSourceView (optional)
  
          `path` the path if provided, otherwise null (optional)
  
          `vimIMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWrite(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.view.View)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.vim_imcontext.VimIMContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("write", closure, after);
  }
}
