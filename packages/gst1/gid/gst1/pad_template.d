/// Module for [PadTemplate] class
module gid.gst1.pad_template;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.pad;
import gid.gst1.static_pad_template;
import gid.gst1.types;

/**
    Padtemplates describe the possible media types a pad or an elementfactory can
    handle. This allows for both inspection of handled types before loading the
    element plugin as well as identifying pads on elements that are not yet
    created (request or sometimes pads).
    
    Pad and PadTemplates have #GstCaps attached to it to describe the media type
    they are capable of dealing with. [gid.gst1.pad_template.PadTemplate.getCaps] or
    GST_PAD_TEMPLATE_CAPS() are used to get the caps of a padtemplate. It's not
    possible to modify the caps of a padtemplate after creation.
    
    PadTemplates have a #GstPadPresence property which identifies the lifetime
    of the pad and that can be retrieved with GST_PAD_TEMPLATE_PRESENCE(). Also
    the direction of the pad can be retrieved from the #GstPadTemplate with
    GST_PAD_TEMPLATE_DIRECTION().
    
    The GST_PAD_TEMPLATE_NAME_TEMPLATE () is important for GST_PAD_REQUEST pads
    because it has to be used as the name in the [gid.gst1.element.Element.requestPadSimple]
    call to instantiate a pad from this template.
    
    Padtemplates can be created with [gid.gst1.pad_template.PadTemplate.new_] or with
    gst_static_pad_template_get (), which creates a #GstPadTemplate from a
    #GstStaticPadTemplate that can be filled with the
    convenient GST_STATIC_PAD_TEMPLATE() macro.
    
    A padtemplate can be used to create a pad (see [gid.gst1.pad.Pad.newFromTemplate]
    or gst_pad_new_from_static_template ()) or to add to an element class
    (see gst_element_class_add_static_pad_template ()).
    
    The following code example shows the code to create a pad from a padtemplate.
    ```c
      GstStaticPadTemplate my_template =
      GST_STATIC_PAD_TEMPLATE (
        "sink",          // the name of the pad
        GST_PAD_SINK,    // the direction of the pad
        GST_PAD_ALWAYS,  // when this pad will be present
        GST_STATIC_CAPS (        // the capabilities of the padtemplate
          "audio/x-raw, "
            "channels = (int) [ 1, 6 ]"
        )
      );
      void
      my_method (void)
      {
        GstPad *pad;
        pad = gst_pad_new_from_static_template (&my_template, "sink");
        ...
      }
    ```
    
    The following example shows you how to add the padtemplate to an
    element class, this is usually done in the class_init of the class:
    ```c
      static void
      my_element_class_init (GstMyElementClass *klass)
      {
        GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
    
        gst_element_class_add_static_pad_template (gstelement_class, &my_template);
      }
    ```
*/
class PadTemplate : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_pad_template_get_type != &gidSymbolNotFound ? gst_pad_template_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstPadTemplate";
  }

  /** Returns `this`, for use in `with` statements. */
  override PadTemplate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.pad_template.PadTemplate]
      Returns: New builder object
  */
  static PadTemplateGidBuilder builder() nothrow
  {
    return new PadTemplateGidBuilder;
  }

  /**
      Get `caps` property.
      Returns: The capabilities of the pad described by the pad template.
  */
  @property gid.gst1.caps.Caps caps() nothrow
  {
    return getCaps();
  }

  /**
      Get `direction` property.
      Returns: The direction of the pad described by the pad template.
  */
  @property gid.gst1.types.PadDirection direction() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.types.PadDirection)("direction");
  }

  /**
      Get `gtype` property.
      Returns: The type of the pad described by the pad template.
  */
  @property gid.gobject2.types.GType gtype() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("gtype");
  }

  /**
      Get `nameTemplate` property.
      Returns: The name template of the pad template.
  */
  @property string nameTemplate() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("name-template");
  }

  /**
      Get `presence` property.
      Returns: When the pad described by the pad template will become available.
  */
  @property gid.gst1.types.PadPresence presence() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.types.PadPresence)("presence");
  }

  /**
      Creates a new pad template with a name according to the given template
      and with the given arguments.
  
      Params:
        nameTemplate = the name template.
        direction = the #GstPadDirection of the template.
        presence = the #GstPadPresence of the pad.
        caps = a #GstCaps set for the template.
      Returns: a new #GstPadTemplate.
  */
  this(string nameTemplate, gid.gst1.types.PadDirection direction, gid.gst1.types.PadPresence presence, gid.gst1.caps.Caps caps) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstPadTemplate* _cretval;
      const(char)* _nameTemplate = nameTemplate.toCString!(No.Malloc, No.Nullable);
      _cretval = gst_pad_template_new(_nameTemplate, direction, presence, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Converts a #GstStaticPadTemplate into a #GstPadTemplate with a type.
  
      Params:
        padTemplate = the static pad template
        padType = The #GType of the pad to create
      Returns: a new #GstPadTemplate.
  */
  static gid.gst1.pad_template.PadTemplate newFromStaticPadTemplateWithGtype(gid.gst1.static_pad_template.StaticPadTemplate padTemplate, gid.gobject2.types.GType padType) nothrow
  {
    GstPadTemplate* _cretval;
    _cretval = gst_pad_template_new_from_static_pad_template_with_gtype(padTemplate ? cast(GstStaticPadTemplate*)padTemplate._cPtr(No.Dup) : null, padType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new pad template with a name according to the given template
      and with the given arguments.
  
      Params:
        nameTemplate = the name template.
        direction = the #GstPadDirection of the template.
        presence = the #GstPadPresence of the pad.
        caps = a #GstCaps set for the template.
        padType = The #GType of the pad to create
      Returns: a new #GstPadTemplate.
  */
  static gid.gst1.pad_template.PadTemplate newWithGtype(string nameTemplate, gid.gst1.types.PadDirection direction, gid.gst1.types.PadPresence presence, gid.gst1.caps.Caps caps, gid.gobject2.types.GType padType) nothrow
  {
    GstPadTemplate* _cretval;
    const(char)* _nameTemplate = nameTemplate.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_pad_template_new_with_gtype(_nameTemplate, direction, presence, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, padType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emit the pad-created signal for this template when created by this pad.
  
      Params:
        pad = the #GstPad that created it
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPadCreated` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPadCreated(gid.gst1.pad.Pad pad)
  {
    auto _klass = cast(GstPadTemplateClass*)_vfuncClass;
    if (!_klass.padCreated)
      return;

    _klass.padCreated(cast(GstPadTemplate*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  }

  /**
      Gets the capabilities of the pad template.
      Returns: the #GstCaps of the pad template.
        Unref after usage.
  */
  gid.gst1.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_template_get_caps(cast(GstPadTemplate*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      See [gid.gst1.pad_template.PadTemplate.setDocumentationCaps].
      Returns: The caps to document. For convenience, this will return
          [gid.gst1.pad_template.PadTemplate.getCaps] when no documentation caps were set.
  */
  gid.gst1.caps.Caps getDocumentationCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_pad_template_get_documentation_caps(cast(GstPadTemplate*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Emit the pad-created signal for this template when created by this pad.
  
      Params:
        pad = the #GstPad that created it
  */
  void padCreated(gid.gst1.pad.Pad pad) nothrow
  {
    gst_pad_template_pad_created(cast(GstPadTemplate*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  }

  /**
      Certain elements will dynamically construct the caps of their
      pad templates. In order not to let environment-specific information
      into the documentation, element authors should use this method to
      expose "stable" caps to the reader.
  
      Params:
        caps = the documented capabilities
  */
  void setDocumentationCaps(gid.gst1.caps.Caps caps) nothrow
  {
    gst_pad_template_set_documentation_caps(cast(GstPadTemplate*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Connect to `PadCreated` signal.
  
      This signal is fired when an element creates a pad from this template.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.pad.Pad pad, gid.gst1.pad_template.PadTemplate padTemplate)`
  
          `pad` the pad that was created. (optional)
  
          `padTemplate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPadCreated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gst1.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gst1.pad_template.PadTemplate)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.pad_template.PadTemplate.padCreated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pad-created", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from PadTemplate
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.pad_template.PadTemplate), T.stringof ~ " is not derived from gid.gst1.pad_template.PadTemplate");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPadCreated", true)[0]) == gid.gst1.pad_template.PadTemplate))
      _installVfunc(klass, "pad_created");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstPadTemplateClass*)klass;

    switch (vfunc)
    {
      case "pad_created":
      {
        static extern(C) void _vfuncPadCreatedTramp(GstPadTemplate* templ, GstPad* pad) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.pad_template.PadTemplate)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)templ);
          if (!_obj)
          {
            auto _klass = cast(GstPadTemplateClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)templ);
            if (_klass.padCreated)
              return (cast(typeof(&_vfuncPadCreatedTramp))_klass.padCreated)(templ, pad);
            return;
          }

          try
          {
            _obj.vfuncPadCreated(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(void*)pad, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.pad_template.PadTemplate.vfuncPadCreated");
          }
        }

        _klass.padCreated = cast(typeof(_klass.padCreated))&_vfuncPadCreatedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.pad_template.PadTemplate]
class PadTemplateGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `caps` property.
      Params:
        propval = The capabilities of the pad described by the pad template.
      Returns: Builder instance for fluent chaining
  */
  T caps(gid.gst1.caps.Caps propval) nothrow
  {
    return setProperty("caps", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The direction of the pad described by the pad template.
      Returns: Builder instance for fluent chaining
  */
  T direction(gid.gst1.types.PadDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `gtype` property.
      Params:
        propval = The type of the pad described by the pad template.
      Returns: Builder instance for fluent chaining
  */
  T gtype(gid.gobject2.types.GType propval) nothrow
  {
    return setProperty("gtype", propval);
  }

  /**
      Set `nameTemplate` property.
      Params:
        propval = The name template of the pad template.
      Returns: Builder instance for fluent chaining
  */
  T nameTemplate(string propval) nothrow
  {
    return setProperty("name-template", propval);
  }

  /**
      Set `presence` property.
      Params:
        propval = When the pad described by the pad template will become available.
      Returns: Builder instance for fluent chaining
  */
  T presence(gid.gst1.types.PadPresence propval) nothrow
  {
    return setProperty("presence", propval);
  }
}

/// Fluent builder for [gid.gst1.pad_template.PadTemplate]
final class PadTemplateGidBuilder : PadTemplateGidBuilderImpl!PadTemplateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PadTemplate build() nothrow
  {
    return new PadTemplate(cast(void*)createGObject(PadTemplate._getGType), Yes.Take);
  }
}
