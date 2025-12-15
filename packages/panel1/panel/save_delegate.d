/// Module for [SaveDelegate] class
module panel.save_delegate;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.icon;
import gio.task;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class SaveDelegate : gobject.object.ObjectWrap
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
    return cast(void function())panel_save_delegate_get_type != &gidSymbolNotFound ? panel_save_delegate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SaveDelegate self()
  {
    return this;
  }

  /**
      Get `icon` property.
      Returns: The "icon" property contains a #GIcon that describes the save
      operation. Generally, this should be the symbolic icon of the
      document class you are saving.
      
      Alternatively, you can use #PanelSaveDelegate:icon-name for a
      named icon.
  */
  @property gio.icon.Icon icon()
  {
    return getIcon();
  }

  /**
      Set `icon` property.
      Params:
        propval = The "icon" property contains a #GIcon that describes the save
        operation. Generally, this should be the symbolic icon of the
        document class you are saving.
        
        Alternatively, you can use #PanelSaveDelegate:icon-name for a
        named icon.
  */
  @property void icon(gio.icon.Icon propval)
  {
    return setIcon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The "icon-name" property contains the name of an icon to use when
      showing information about the save operation in UI such as a save
      dialog.
      
      You can also use #PanelSaveDelegate:icon to set a #GIcon instead of
      an icon name.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The "icon-name" property contains the name of an icon to use when
        showing information about the save operation in UI such as a save
        dialog.
        
        You can also use #PanelSaveDelegate:icon to set a #GIcon instead of
        an icon name.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `isDraft` property.
      Returns: The "is-draft" property indicates that the document represented by the
      delegate is a draft and might be lost of not saved.
  */
  @property bool isDraft()
  {
    return getIsDraft();
  }

  /**
      Set `isDraft` property.
      Params:
        propval = The "is-draft" property indicates that the document represented by the
        delegate is a draft and might be lost of not saved.
  */
  @property void isDraft(bool propval)
  {
    return setIsDraft(propval);
  }

  /**
      Get `progress` property.
      Returns: The "progress" property contains progress between 0.0 and 1.0 and
      should be updated by the delegate implementation as saving progresses.
  */
  @property double progress()
  {
    return getProgress();
  }

  /**
      Set `progress` property.
      Params:
        propval = The "progress" property contains progress between 0.0 and 1.0 and
        should be updated by the delegate implementation as saving progresses.
  */
  @property void progress(double propval)
  {
    return setProgress(propval);
  }

  /**
      Get `subtitle` property.
      Returns: The "subtitle" property contains additional information that may
      not make sense to put in the title. This might include the directory
      that the file will be saved within.
  */
  @property string subtitle()
  {
    return getSubtitle();
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The "subtitle" property contains additional information that may
        not make sense to put in the title. This might include the directory
        that the file will be saved within.
  */
  @property void subtitle(string propval)
  {
    return setSubtitle(propval);
  }

  /**
      Get `title` property.
      Returns: The "title" property contains the title of the document being saved.
      Generally, this should be the base name of the document such as
      `file.txt`.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The "title" property contains the title of the document being saved.
        Generally, this should be the base name of the document such as
        `file.txt`.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Create a new #PanelSaveDelegate.
      Returns: a newly created #PanelSaveDelegate
  */
  this()
  {
    PanelSaveDelegate* _cretval;
    _cretval = panel_save_delegate_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void close()
  {
    panel_save_delegate_close(cast(PanelSaveDelegate*)this._cPtr);
  }

  /** */
  void discard()
  {
    panel_save_delegate_discard(cast(PanelSaveDelegate*)this._cPtr);
  }

  /**
      Gets the #GIcon for the save delegate, or null if unset.
      Returns: a #GIcon or null
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = panel_save_delegate_get_icon(cast(PanelSaveDelegate*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for the save delegate.
      Returns: the icon name or null
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_icon_name(cast(PanelSaveDelegate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  bool getIsDraft()
  {
    bool _retval;
    _retval = cast(bool)panel_save_delegate_get_is_draft(cast(PanelSaveDelegate*)this._cPtr);
    return _retval;
  }

  /** */
  double getProgress()
  {
    double _retval;
    _retval = panel_save_delegate_get_progress(cast(PanelSaveDelegate*)this._cPtr);
    return _retval;
  }

  /**
      Gets the subtitle for the save delegate.
      Returns: the subtitle or null
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_subtitle(cast(PanelSaveDelegate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the title for the save delegate.
      Returns: the title or null
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_title(cast(PanelSaveDelegate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  void saveAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_save_delegate_save_async(cast(PanelSaveDelegate*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool saveFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_save_delegate_save_finish(cast(PanelSaveDelegate*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the #GIcon for the save delegate. Pass null to unset.
  
      Params:
        icon = a #GIcon or null
  */
  void setIcon(gio.icon.Icon icon = null)
  {
    panel_save_delegate_set_icon(cast(PanelSaveDelegate*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for the save delegate. Pass null to unset.
  
      Params:
        icon = the icon name or null
  */
  void setIconName(string icon = null)
  {
    const(char)* _icon = icon.toCString(No.Alloc);
    panel_save_delegate_set_icon_name(cast(PanelSaveDelegate*)this._cPtr, _icon);
  }

  /** */
  void setIsDraft(bool isDraft)
  {
    panel_save_delegate_set_is_draft(cast(PanelSaveDelegate*)this._cPtr, isDraft);
  }

  /** */
  void setProgress(double progress)
  {
    panel_save_delegate_set_progress(cast(PanelSaveDelegate*)this._cPtr, progress);
  }

  /**
      Sets the subtitle for the save delegate. Pass null to unset.
  
      Params:
        subtitle = the subtitle or null
  */
  void setSubtitle(string subtitle = null)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    panel_save_delegate_set_subtitle(cast(PanelSaveDelegate*)this._cPtr, _subtitle);
  }

  /**
      Sets the title for the save delegate. Pass null to unset.
  
      Params:
        title = the title or null
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    panel_save_delegate_set_title(cast(PanelSaveDelegate*)this._cPtr, _title);
  }

  /**
      Connect to `Close` signal.
  
      This signal is emitted when the save delegate should close
      the widget it is related to. This can happen after saving as
      part of a close request and it is now save for the delegate to
      close.
      
      Implementations are encouraged to connect to this signal (or
      implement the virtual method) and call [panel.widget.Widget.forceClose].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(panel.save_delegate.SaveDelegate saveDelegate))
  
          `saveDelegate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.save_delegate.SaveDelegate)))
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
      Connect to `Discard` signal.
  
      This signal is emitted when the user has requested that the
      delegate discard the changes instead of saving them.
      
      Implementations are encouraged to connect to this signal (or
      implement the virtual method) and revert the document to the
      last saved state and/or close the document.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(panel.save_delegate.SaveDelegate saveDelegate))
  
          `saveDelegate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDiscard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : panel.save_delegate.SaveDelegate)))
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
    return connectSignalClosure("discard", closure, after);
  }

  /**
      Connect to `Save` signal.
  
      This signal can be used when subclassing #PanelSaveDelegate is not
      possible or cumbersome. The default implementation of
      #PanelSaveDelegateClass.save_async() will emit this signal to allow
      the consumer to implement asynchronous save in a flexible manner.
      
      The caller is expected to complete task with a boolean when the
      save operation has completed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.task.Task task, panel.save_delegate.SaveDelegate saveDelegate))
  
          `task` a #GTask (optional)
  
          `saveDelegate` the instance the signal is connected to (optional)
  
          `Returns` true if the operation was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.task.Task)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : panel.save_delegate.SaveDelegate)))
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
    return connectSignalClosure("save", closure, after);
  }
}
