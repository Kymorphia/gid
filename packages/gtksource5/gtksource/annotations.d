/// Module for [Annotations] class
module gtksource.annotations;

public import gid.basictypes;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtksource.annotation_provider;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Use this object to manage [gtksource.annotation.Annotation]s. Each [gtksource.view.View] has a single annotation
    manager and it is guaranteed to be the same for the lifetime of [gtksource.view.View].
    
    Add [gtksource.annotation_provider.AnnotationProvider]s with [gtksource.annotations.Annotations.addProvider] to
    display all the annotations added to each [gtksource.annotation_provider.AnnotationProvider].
*/
class Annotations : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_annotations_get_type != &gidSymbolNotFound ? gtk_source_annotations_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Annotations self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.annotations.Annotations]
      Returns: New builder object
  */
  static AnnotationsGidBuilder builder() nothrow
  {
    return new AnnotationsGidBuilder;
  }

  /**
      Adds a new annotation provider.
  
      Params:
        provider = a #GtkSourceAnnotationProvider.
  */
  void addProvider(gtksource.annotation_provider.AnnotationProvider provider) nothrow
  {
    gtk_source_annotations_add_provider(cast(GtkSourceAnnotations*)this._cPtr, provider ? cast(GtkSourceAnnotationProvider*)provider._cPtr(No.Dup) : null);
  }

  /**
      Removes a provider.
  
      Params:
        provider = a #GtkSourceAnnotationProvider.
      Returns: true if the provider was found and removed
  */
  bool removeProvider(gtksource.annotation_provider.AnnotationProvider provider) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_annotations_remove_provider(cast(GtkSourceAnnotations*)this._cPtr, provider ? cast(GtkSourceAnnotationProvider*)provider._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtksource.annotations.Annotations annotations)`
  
          `annotations` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.annotations.Annotations)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtksource.annotations.Annotations.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gtksource.annotations.Annotations]
class AnnotationsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtksource.annotations.Annotations]
final class AnnotationsGidBuilder : AnnotationsGidBuilderImpl!AnnotationsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Annotations build() nothrow
  {
    return new Annotations(cast(void*)createGObject(Annotations._getGType), Yes.Take);
  }
}
