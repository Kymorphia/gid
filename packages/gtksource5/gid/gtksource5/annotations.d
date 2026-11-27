/// Module for [Annotations] class
module gid.gtksource5.annotations;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.annotation_provider;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Use this object to manage [gid.gtksource5.annotation.Annotation]s. Each [gid.gtksource5.view.View] has a single annotation
    manager and it is guaranteed to be the same for the lifetime of [gid.gtksource5.view.View].
    
    Add [gid.gtksource5.annotation_provider.AnnotationProvider]s with [gid.gtksource5.annotations.Annotations.addProvider] to
    display all the annotations added to each [gid.gtksource5.annotation_provider.AnnotationProvider].
*/
@gidGir("Annotations", "AnnotationsClass")
class Annotations : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_annotations_get_type != &gidSymbolNotFound ? gtk_source_annotations_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceAnnotations";
  }

  /** Returns `this`, for use in `with` statements. */
  override Annotations self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.annotations.Annotations]
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
  void addProvider(gid.gtksource5.annotation_provider.AnnotationProvider provider) nothrow
  {
    gtk_source_annotations_add_provider(cast(GtkSourceAnnotations*)this._cPtr, provider ? cast(GtkSourceAnnotationProvider*)provider._cPtr(No.Dup) : null);
  }

  /**
      Removes a provider.
  
      Params:
        provider = a #GtkSourceAnnotationProvider.
      Returns: true if the provider was found and removed
  */
  bool removeProvider(gid.gtksource5.annotation_provider.AnnotationProvider provider) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_annotations_remove_provider(cast(GtkSourceAnnotations*)this._cPtr, provider ? cast(GtkSourceAnnotationProvider*)provider._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource5.annotations.Annotations annotations)`
  
          `annotations` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.annotations.Annotations)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.annotations.Annotations.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.annotations.Annotations]
class AnnotationsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtksource5.annotations.Annotations]
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
