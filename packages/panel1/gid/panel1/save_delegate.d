/// Module for [SaveDelegate] class
module gid.panel1.save_delegate;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.icon;
import gid.gio2.task;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/** */
@gidGir("SaveDelegate", "SaveDelegateClass")
class SaveDelegate : gid.gobject2.object.ObjectWrap
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
    return cast(void function())panel_save_delegate_get_type != &gidSymbolNotFound ? panel_save_delegate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelSaveDelegate";
  }

  /** Returns `this`, for use in `with` statements. */
  override SaveDelegate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.save_delegate.SaveDelegate]
      Returns: New builder object
  */
  static SaveDelegateGidBuilder builder() nothrow
  {
    return new SaveDelegateGidBuilder;
  }

  /**
      Get `icon` property.
      Returns: The "icon" property contains a #GIcon that describes the save
        operation. Generally, this should be the symbolic icon of the
        document class you are saving.
        
        Alternatively, you can use #PanelSaveDelegate:icon-name for a
        named icon.
  */
  @property gid.gio2.icon.Icon icon() nothrow
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
  @property void icon(gid.gio2.icon.Icon propval) nothrow
  {
    setIcon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The "icon-name" property contains the name of an icon to use when
        showing information about the save operation in UI such as a save
        dialog.
        
        You can also use #PanelSaveDelegate:icon to set a #GIcon instead of
        an icon name.
  */
  @property string iconName() nothrow
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
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `isDraft` property.
      Returns: The "is-draft" property indicates that the document represented by the
        delegate is a draft and might be lost of not saved.
  */
  @property bool isDraft() nothrow
  {
    return getIsDraft();
  }

  /**
      Set `isDraft` property.
      Params:
        propval = The "is-draft" property indicates that the document represented by the
          delegate is a draft and might be lost of not saved.
  */
  @property void isDraft(bool propval) nothrow
  {
    setIsDraft(propval);
  }

  /**
      Get `progress` property.
      Returns: The "progress" property contains progress between 0.0 and 1.0 and
        should be updated by the delegate implementation as saving progresses.
  */
  @property double progress() nothrow
  {
    return getProgress();
  }

  /**
      Set `progress` property.
      Params:
        propval = The "progress" property contains progress between 0.0 and 1.0 and
          should be updated by the delegate implementation as saving progresses.
  */
  @property void progress(double propval) nothrow
  {
    setProgress(propval);
  }

  /**
      Get `subtitle` property.
      Returns: The "subtitle" property contains additional information that may
        not make sense to put in the title. This might include the directory
        that the file will be saved within.
  */
  @property string subtitle() nothrow
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
  @property void subtitle(string propval) nothrow
  {
    setSubtitle(propval);
  }

  /**
      Get `title` property.
      Returns: The "title" property contains the title of the document being saved.
        Generally, this should be the base name of the document such as
        `file.txt`.
  */
  @property string title() nothrow
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
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Create a new #PanelSaveDelegate.
      Returns: a newly created #PanelSaveDelegate
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      PanelSaveDelegate* _cretval;
      _cretval = panel_save_delegate_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncClose()
  {
    auto _klass = cast(PanelSaveDelegateClass*)_vfuncClass;
    if (!_klass.close)
      return;

    _klass.close(cast(PanelSaveDelegate*)this._cPtr);
  }

  /** */
  protected void vfuncDiscard()
  {
    auto _klass = cast(PanelSaveDelegateClass*)_vfuncClass;
    if (!_klass.discard)
      return;

    _klass.discard(cast(PanelSaveDelegate*)this._cPtr);
  }

  /** */
  protected bool vfuncSave(gid.gio2.task.Task task)
  {
    auto _klass = cast(PanelSaveDelegateClass*)_vfuncClass;
    if (!_klass.save)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.save(cast(PanelSaveDelegate*)this._cPtr, task ? cast(GTask*)task._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected void vfuncSaveAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(PanelSaveDelegateClass*)_vfuncClass;
    if (!_klass.saveAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.saveAsync(cast(PanelSaveDelegate*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  protected bool vfuncSaveFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(PanelSaveDelegateClass*)_vfuncClass;
    if (!_klass.saveFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.saveFinish(cast(PanelSaveDelegate*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  void close() nothrow
  {
    panel_save_delegate_close(cast(PanelSaveDelegate*)this._cPtr);
  }

  /** */
  void discard() nothrow
  {
    panel_save_delegate_discard(cast(PanelSaveDelegate*)this._cPtr);
  }

  /**
      Gets the #GIcon for the save delegate, or null if unset.
      Returns: a #GIcon or null
  */
  gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = panel_save_delegate_get_icon(cast(PanelSaveDelegate*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for the save delegate.
      Returns: the icon name or null
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_icon_name(cast(PanelSaveDelegate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  bool getIsDraft() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_save_delegate_get_is_draft(cast(PanelSaveDelegate*)this._cPtr);
    return _retval;
  }

  /** */
  double getProgress() nothrow
  {
    double _retval;
    _retval = panel_save_delegate_get_progress(cast(PanelSaveDelegate*)this._cPtr);
    return _retval;
  }

  /**
      Gets the subtitle for the save delegate.
      Returns: the subtitle or null
  */
  string getSubtitle() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_subtitle(cast(PanelSaveDelegate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the title for the save delegate.
      Returns: the title or null
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_save_delegate_get_title(cast(PanelSaveDelegate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  void saveAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_save_delegate_save_async(cast(PanelSaveDelegate*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool saveFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_save_delegate_save_finish(cast(PanelSaveDelegate*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the #GIcon for the save delegate. Pass null to unset.
  
      Params:
        icon = a #GIcon or null
  */
  void setIcon(gid.gio2.icon.Icon icon = null) nothrow
  {
    panel_save_delegate_set_icon(cast(PanelSaveDelegate*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for the save delegate. Pass null to unset.
  
      Params:
        icon = the icon name or null
  */
  void setIconName(string icon = null) nothrow
  {
    const(char)* _icon = icon.toCString!(No.Malloc, Yes.Nullable);
    panel_save_delegate_set_icon_name(cast(PanelSaveDelegate*)this._cPtr, _icon);
  }

  /** */
  void setIsDraft(bool isDraft) nothrow
  {
    panel_save_delegate_set_is_draft(cast(PanelSaveDelegate*)this._cPtr, isDraft);
  }

  /** */
  void setProgress(double progress) nothrow
  {
    panel_save_delegate_set_progress(cast(PanelSaveDelegate*)this._cPtr, progress);
  }

  /**
      Sets the subtitle for the save delegate. Pass null to unset.
  
      Params:
        subtitle = the subtitle or null
  */
  void setSubtitle(string subtitle = null) nothrow
  {
    const(char)* _subtitle = subtitle.toCString!(No.Malloc, Yes.Nullable);
    panel_save_delegate_set_subtitle(cast(PanelSaveDelegate*)this._cPtr, _subtitle);
  }

  /**
      Sets the title for the save delegate. Pass null to unset.
  
      Params:
        title = the title or null
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    panel_save_delegate_set_title(cast(PanelSaveDelegate*)this._cPtr, _title);
  }

  /**
      Connect to `Close` signal.
  
      This signal is emitted when the save delegate should close
        the widget it is related to. This can happen after saving as
        part of a close request and it is now save for the delegate to
        close.
        
        Implementations are encouraged to connect to this signal (or
        implement the virtual method) and call [gid.panel1.widget.Widget.forceClose].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.panel1.save_delegate.SaveDelegate saveDelegate)`
  
          `saveDelegate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClose(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.save_delegate.SaveDelegate)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.save_delegate.SaveDelegate.close");
      }
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
  
          `void callback(gid.panel1.save_delegate.SaveDelegate saveDelegate)`
  
          `saveDelegate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDiscard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.panel1.save_delegate.SaveDelegate)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.save_delegate.SaveDelegate.discard");
      }
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
  
          `bool callback(gid.gio2.task.Task task, gid.panel1.save_delegate.SaveDelegate saveDelegate)`
  
          `task` a #GTask (optional)
  
          `saveDelegate` the instance the signal is connected to (optional)
  
          `Returns` true if the operation was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSave(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.task.Task)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.panel1.save_delegate.SaveDelegate)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.panel1.save_delegate.SaveDelegate.save");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("save", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SaveDelegate
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.panel1.save_delegate.SaveDelegate), T.stringof ~ " is not derived from gid.panel1.save_delegate.SaveDelegate");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.panel1.save_delegate.SaveDelegate))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDiscard", true)[0]) == gid.panel1.save_delegate.SaveDelegate))
      _installVfunc(klass, "discard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSave", true)[0]) == gid.panel1.save_delegate.SaveDelegate))
      _installVfunc(klass, "save");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSaveAsync", true)[0]) == gid.panel1.save_delegate.SaveDelegate))
      static assert(0, "Overriding gid.panel1.save_delegate.SaveDelegate.vfuncSaveAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSaveFinish", true)[0]) == gid.panel1.save_delegate.SaveDelegate))
      _installVfunc(klass, "save_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(PanelSaveDelegateClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) void _vfuncCloseTramp(PanelSaveDelegate* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.panel1.save_delegate.SaveDelegate)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelSaveDelegateClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(self);
            return;
          }

          try
          {
            _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.save_delegate.SaveDelegate.vfuncClose");
          }
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "discard":
      {
        static extern(C) void _vfuncDiscardTramp(PanelSaveDelegate* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.panel1.save_delegate.SaveDelegate)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelSaveDelegateClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.discard)
              return (cast(typeof(&_vfuncDiscardTramp))_klass.discard)(self);
            return;
          }

          try
          {
            _obj.vfuncDiscard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.save_delegate.SaveDelegate.vfuncDiscard");
          }
        }

        _klass.discard = cast(typeof(_klass.discard))&_vfuncDiscardTramp;
        break;
      }
      case "save":
      {
        static extern(C) gboolean _vfuncSaveTramp(PanelSaveDelegate* self, GTask* task) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.panel1.save_delegate.SaveDelegate)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelSaveDelegateClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.save)
              return (cast(typeof(&_vfuncSaveTramp))_klass.save)(self, task);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSave(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.task.Task)(cast(void*)task, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.save_delegate.SaveDelegate.vfuncSave");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.save = cast(typeof(_klass.save))&_vfuncSaveTramp;
        break;
      }
      case "save_finish":
      {
        static extern(C) gboolean _vfuncSaveFinishTramp(PanelSaveDelegate* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.panel1.save_delegate.SaveDelegate)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelSaveDelegateClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.saveFinish)
              return (cast(typeof(&_vfuncSaveFinishTramp))_klass.saveFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSaveFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.saveFinish = cast(typeof(_klass.saveFinish))&_vfuncSaveFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.panel1.save_delegate.SaveDelegate]
class SaveDelegateGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `icon` property.
      Params:
        propval = The "icon" property contains a #GIcon that describes the save
          operation. Generally, this should be the symbolic icon of the
          document class you are saving.
          
          Alternatively, you can use #PanelSaveDelegate:icon-name for a
          named icon.
      Returns: Builder instance for fluent chaining
  */
  T icon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("icon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The "icon-name" property contains the name of an icon to use when
          showing information about the save operation in UI such as a save
          dialog.
          
          You can also use #PanelSaveDelegate:icon to set a #GIcon instead of
          an icon name.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `isDraft` property.
      Params:
        propval = The "is-draft" property indicates that the document represented by the
          delegate is a draft and might be lost of not saved.
      Returns: Builder instance for fluent chaining
  */
  T isDraft(bool propval) nothrow
  {
    return setProperty("is-draft", propval);
  }

  /**
      Set `progress` property.
      Params:
        propval = The "progress" property contains progress between 0.0 and 1.0 and
          should be updated by the delegate implementation as saving progresses.
      Returns: Builder instance for fluent chaining
  */
  T progress(double propval) nothrow
  {
    return setProperty("progress", propval);
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The "subtitle" property contains additional information that may
          not make sense to put in the title. This might include the directory
          that the file will be saved within.
      Returns: Builder instance for fluent chaining
  */
  T subtitle(string propval) nothrow
  {
    return setProperty("subtitle", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The "title" property contains the title of the document being saved.
          Generally, this should be the base name of the document such as
          `file.txt`.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.panel1.save_delegate.SaveDelegate]
final class SaveDelegateGidBuilder : SaveDelegateGidBuilderImpl!SaveDelegateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SaveDelegate build() nothrow
  {
    return new SaveDelegate(cast(void*)createGObject(SaveDelegate._getGType), Yes.Take);
  }
}
