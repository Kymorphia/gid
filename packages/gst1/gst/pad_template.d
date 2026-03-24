/// Module for [PadTemplate] class
module gst.pad_template;

import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.object;
import gst.pad;
import gst.static_pad_template;
import gst.types;

/**
    Padtemplates describe the possible media types a pad or an elementfactory can
    handle. This allows for both inspection of handled types before loading the
    element plugin as well as identifying pads on elements that are not yet
    created (request or sometimes pads).
    
    Pad and PadTemplates have #GstCaps attached to it to describe the media type
    they are capable of dealing with. [gst.pad_template.PadTemplate.getCaps] or
    GST_PAD_TEMPLATE_CAPS() are used to get the caps of a padtemplate. It's not
    possible to modify the caps of a padtemplate after creation.
    
    PadTemplates have a #GstPadPresence property which identifies the lifetime
    of the pad and that can be retrieved with GST_PAD_TEMPLATE_PRESENCE(). Also
    the direction of the pad can be retrieved from the #GstPadTemplate with
    GST_PAD_TEMPLATE_DIRECTION().
    
    The GST_PAD_TEMPLATE_NAME_TEMPLATE () is important for GST_PAD_REQUEST pads
    because it has to be used as the name in the [gst.element.Element.requestPadSimple]
    call to instantiate a pad from this template.
    
    Padtemplates can be created with [gst.pad_template.PadTemplate.new_] or with
    gst_static_pad_template_get (), which creates a #GstPadTemplate from a
    #GstStaticPadTemplate that can be filled with the
    convenient GST_STATIC_PAD_TEMPLATE() macro.
    
    A padtemplate can be used to create a pad (see [gst.pad.Pad.newFromTemplate]
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
class PadTemplate : gst.object.ObjectWrap
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
    return cast(void function())gst_pad_template_get_type != &gidSymbolNotFound ? gst_pad_template_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PadTemplate self()
  {
    return this;
  }

  /**
  Get builder for [gst.pad_template.PadTemplate]
  Returns: New builder object
  */
  static PadTemplateGidBuilder builder()
  {
    return new PadTemplateGidBuilder;
  }

  /**
      Get `caps` property.
      Returns: The capabilities of the pad described by the pad template.
  */
  @property gst.caps.Caps caps()
  {
    return getCaps();
  }

  /**
      Get `direction` property.
      Returns: The direction of the pad described by the pad template.
  */
  @property gst.types.PadDirection direction()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.PadDirection)("direction");
  }

  /**
      Get `gtype` property.
      Returns: The type of the pad described by the pad template.
  */
  @property gobject.types.GType gtype()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("gtype");
  }

  /**
      Get `nameTemplate` property.
      Returns: The name template of the pad template.
  */
  @property string nameTemplate()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name-template");
  }

  /**
      Get `presence` property.
      Returns: When the pad described by the pad template will become available.
  */
  @property gst.types.PadPresence presence()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.PadPresence)("presence");
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
  this(string nameTemplate, gst.types.PadDirection direction, gst.types.PadPresence presence, gst.caps.Caps caps)
  {
    GstPadTemplate* _cretval;
    const(char)* _nameTemplate = nameTemplate.toCString(No.Alloc);
    _cretval = gst_pad_template_new(_nameTemplate, direction, presence, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Converts a #GstStaticPadTemplate into a #GstPadTemplate with a type.
  
      Params:
        padTemplate = the static pad template
        padType = The #GType of the pad to create
      Returns: a new #GstPadTemplate.
  */
  static gst.pad_template.PadTemplate newFromStaticPadTemplateWithGtype(gst.static_pad_template.StaticPadTemplate padTemplate, gobject.types.GType padType)
  {
    GstPadTemplate* _cretval;
    _cretval = gst_pad_template_new_from_static_pad_template_with_gtype(padTemplate ? cast(GstStaticPadTemplate*)padTemplate._cPtr : null, padType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
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
  static gst.pad_template.PadTemplate newWithGtype(string nameTemplate, gst.types.PadDirection direction, gst.types.PadPresence presence, gst.caps.Caps caps, gobject.types.GType padType)
  {
    GstPadTemplate* _cretval;
    const(char)* _nameTemplate = nameTemplate.toCString(No.Alloc);
    _cretval = gst_pad_template_new_with_gtype(_nameTemplate, direction, presence, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, padType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the capabilities of the pad template.
      Returns: the #GstCaps of the pad template.
        Unref after usage.
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_pad_template_get_caps(cast(GstPadTemplate*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      See [gst.pad_template.PadTemplate.setDocumentationCaps].
      Returns: The caps to document. For convenience, this will return
          [gst.pad_template.PadTemplate.getCaps] when no documentation caps were set.
  */
  gst.caps.Caps getDocumentationCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_pad_template_get_documentation_caps(cast(GstPadTemplate*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Emit the pad-created signal for this template when created by this pad.
  
      Params:
        pad = the #GstPad that created it
  */
  void padCreated(gst.pad.Pad pad)
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
  void setDocumentationCaps(gst.caps.Caps caps)
  {
    gst_pad_template_set_documentation_caps(cast(GstPadTemplate*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Connect to `PadCreated` signal.
  
      This signal is fired when an element creates a pad from this template.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.pad.Pad pad, gst.pad_template.PadTemplate padTemplate))
  
          `pad` the pad that was created. (optional)
  
          `padTemplate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPadCreated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.pad_template.PadTemplate)))
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
    return connectSignalClosure("pad-created", closure, after);
  }
}

class PadTemplateGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `caps` property.
      Params:
        propval = The capabilities of the pad described by the pad template.
      Returns: Builder instance for fluent chaining
  */
  T caps(gst.caps.Caps propval)
  {
    return setProperty("caps", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The direction of the pad described by the pad template.
      Returns: Builder instance for fluent chaining
  */
  T direction(gst.types.PadDirection propval)
  {
    return setProperty("direction", propval);
  }

  /**
      Set `gtype` property.
      Params:
        propval = The type of the pad described by the pad template.
      Returns: Builder instance for fluent chaining
  */
  T gtype(gobject.types.GType propval)
  {
    return setProperty("gtype", propval);
  }

  /**
      Set `nameTemplate` property.
      Params:
        propval = The name template of the pad template.
      Returns: Builder instance for fluent chaining
  */
  T nameTemplate(string propval)
  {
    return setProperty("name-template", propval);
  }

  /**
      Set `presence` property.
      Params:
        propval = When the pad described by the pad template will become available.
      Returns: Builder instance for fluent chaining
  */
  T presence(gst.types.PadPresence propval)
  {
    return setProperty("presence", propval);
  }
}

/// Fluent builder for [gst.pad_template.PadTemplate]
final class PadTemplateGidBuilder : PadTemplateGidBuilderImpl!PadTemplateGidBuilder
{
  PadTemplate build()
  {
    return new PadTemplate(cast(void*)createGObject(PadTemplate._getGType), No.Take);
  }
}
