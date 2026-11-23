/// Module for [AnnotationProvider] class
module gid.gtksource5.annotation_provider;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.annotation;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.hover_display;
import gid.gtksource5.types;

/**
    It is used to provide annotations and display them on [gid.gtksource5.view.View] and also populate
    [gid.gtksource5.hover_display.HoverDisplay] when the user hovers over an annotation.
    
    You can subclass this object and implement [gid.gtksource5.annotation_provider.AnnotationProvider.populateHoverAsync] and
    [gid.gtksource5.annotation_provider.AnnotationProvider.populateHoverFinish] or connect to `signal@AnnotationProvider::populate`
    and call `method@AnnotationProvider.populate` or do it asynchronously.
*/
class AnnotationProvider : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_annotation_provider_get_type != &gidSymbolNotFound ? gtk_source_annotation_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceAnnotationProvider";
  }

  /** Returns `this`, for use in `with` statements. */
  override AnnotationProvider self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.annotation_provider.AnnotationProvider]
      Returns: New builder object
  */
  static AnnotationProviderGidBuilder builder() nothrow
  {
    return new AnnotationProviderGidBuilder;
  }

  /**
      Used to create a new annotation provider.
      Returns: a new #GtkSourceAnnotationProvider
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkSourceAnnotationProvider* _cretval;
      _cretval = gtk_source_annotation_provider_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Used to populate the [gid.gtksource5.hover_display.HoverDisplay] asynchronously, use
      `methodAnnotationProvider.populate_hover` to do it synchronously.
  
      Params:
        annotation = a #GtkSourceAnnotation
        display = a #GtkSourceHoverDisplay to populate
        cancellable = 
        callback = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPopulateHoverAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncPopulateHoverAsync(gid.gtksource5.annotation.Annotation annotation, gid.gtksource5.hover_display.HoverDisplay display, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GtkSourceAnnotationProviderClass*)_vfuncClass;
    if (!_klass.populateHoverAsync)
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
    _klass.populateHoverAsync(cast(GtkSourceAnnotationProvider*)this._cPtr, annotation ? cast(GtkSourceAnnotation*)annotation._cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes populating the [gid.gtksource5.hover_display.HoverDisplay] asynchronously.
  
      Params:
        result = 
      Returns: true if successful; otherwise false and error is set.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPopulateHoverFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPopulateHoverFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GtkSourceAnnotationProviderClass*)_vfuncClass;
    if (!_klass.populateHoverFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.populateHoverFinish(cast(GtkSourceAnnotationProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Add an annotation to the provider.
  
      Params:
        annotation = 
  */
  void addAnnotation(gid.gtksource5.annotation.Annotation annotation) nothrow
  {
    gtk_source_annotation_provider_add_annotation(cast(GtkSourceAnnotationProvider*)this._cPtr, annotation ? cast(GtkSourceAnnotation*)annotation._cPtr(No.Dup) : null);
  }

  /**
      Used to populate the [gid.gtksource5.hover_display.HoverDisplay] asynchronously, use
      `methodAnnotationProvider.populate_hover` to do it synchronously.
  
      Params:
        annotation = a #GtkSourceAnnotation
        display = a #GtkSourceHoverDisplay to populate
        cancellable = 
        callback = 
  */
  void populateHoverAsync(gid.gtksource5.annotation.Annotation annotation, gid.gtksource5.hover_display.HoverDisplay display, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    gtk_source_annotation_provider_populate_hover_async(cast(GtkSourceAnnotationProvider*)this._cPtr, annotation ? cast(GtkSourceAnnotation*)annotation._cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes populating the [gid.gtksource5.hover_display.HoverDisplay] asynchronously.
  
      Params:
        result = 
      Returns: true if successful; otherwise false and error is set.
      Throws: [ErrorWrap]
  */
  bool populateHoverFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_annotation_provider_populate_hover_finish(cast(GtkSourceAnnotationProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Removes all annotations from the provider.
  */
  void removeAll() nothrow
  {
    gtk_source_annotation_provider_remove_all(cast(GtkSourceAnnotationProvider*)this._cPtr);
  }

  /**
      Remove an annotation from the provider.
  
      Params:
        annotation = 
      Returns: true if the annotation was found and removed
  */
  bool removeAnnotation(gid.gtksource5.annotation.Annotation annotation) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_annotation_provider_remove_annotation(cast(GtkSourceAnnotationProvider*)this._cPtr, annotation ? cast(GtkSourceAnnotation*)annotation._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.annotation_provider.AnnotationProvider annotationProvider)`
  
          `annotationProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.annotation_provider.AnnotationProvider)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.annotation_provider.AnnotationProvider.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AnnotationProvider
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtksource5.annotation_provider.AnnotationProvider), T.stringof ~ " is not derived from gid.gtksource5.annotation_provider.AnnotationProvider");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopulateHoverAsync", true)[0]) == gid.gtksource5.annotation_provider.AnnotationProvider))
      static assert(0, "Overriding gid.gtksource5.annotation_provider.AnnotationProvider.vfuncPopulateHoverAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopulateHoverFinish", true)[0]) == gid.gtksource5.annotation_provider.AnnotationProvider))
      _installVfunc(klass, "populate_hover_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceAnnotationProviderClass*)klass;

    switch (vfunc)
    {
      case "populate_hover_finish":
      {
        static extern(C) gboolean _vfuncPopulateHoverFinishTramp(GtkSourceAnnotationProvider* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.annotation_provider.AnnotationProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceAnnotationProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.populateHoverFinish)
              return (cast(typeof(&_vfuncPopulateHoverFinishTramp))_klass.populateHoverFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPopulateHoverFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.populateHoverFinish = cast(typeof(_klass.populateHoverFinish))&_vfuncPopulateHoverFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.annotation_provider.AnnotationProvider]
class AnnotationProviderGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtksource5.annotation_provider.AnnotationProvider]
final class AnnotationProviderGidBuilder : AnnotationProviderGidBuilderImpl!AnnotationProviderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AnnotationProvider build() nothrow
  {
    return new AnnotationProvider(cast(void*)createGObject(AnnotationProvider._getGType), Yes.Take);
  }
}
