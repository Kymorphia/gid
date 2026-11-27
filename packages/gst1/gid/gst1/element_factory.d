/// Module for [ElementFactory] class
module gid.gst1.element_factory;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.plugin_feature;
import gid.gst1.static_pad_template;
import gid.gst1.types;

/**
    #GstElementFactory is used to create instances of elements. A
    GstElementFactory can be added to a #GstPlugin as it is also a
    #GstPluginFeature.
    
    Use the [gid.gst1.element_factory.ElementFactory.find] and [gid.gst1.element_factory.ElementFactory.create]
    functions to create element instances or use [gid.gst1.element_factory.ElementFactory.make] as a
    convenient shortcut.
    
    The following code example shows you how to create a GstFileSrc element.
    
    ## Using an element factory
    ```c
      #include <gst/gst.h>
    
      GstElement *src;
      GstElementFactory *srcfactory;
    
      gst_init (&argc, &argv);
    
      srcfactory = gst_element_factory_find ("filesrc");
      g_return_if_fail (srcfactory != NULL);
      src = gst_element_factory_create (srcfactory, "src");
      g_return_if_fail (src != NULL);
      ...
    ```
*/
@gidGir("ElementFactory", "ElementFactoryClass")
class ElementFactory : gid.gst1.plugin_feature.PluginFeature
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
    return cast(void function())gst_element_factory_get_type != &gidSymbolNotFound ? gst_element_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstElementFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override ElementFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.element_factory.ElementFactory]
      Returns: New builder object
  */
  static ElementFactoryGidBuilder builder() nothrow
  {
    return new ElementFactoryGidBuilder;
  }

  /**
      Search for an element factory of the given name. Refs the returned
      element factory; caller is responsible for unreffing.
  
      Params:
        name = name of factory to find
      Returns: #GstElementFactory if found,
        null otherwise
  */
  static gid.gst1.element_factory.ElementFactory find(string name) nothrow
  {
    GstElementFactory* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_element_factory_find(_name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element_factory.ElementFactory)(cast(GstElementFactory*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Filter out all the elementfactories in list that can handle caps in
      the given direction.
      
      If subsetonly is true, then only the elements whose pads templates
      are a complete superset of caps will be returned. Else any element
      whose pad templates caps can intersect with caps will be returned.
  
      Params:
        list = a #GList of
              #GstElementFactory to filter
        caps = a #GstCaps
        direction = a #GstPadDirection to filter on
        subsetonly = whether to filter on caps subsets or not.
      Returns: a #GList of
            #GstElementFactory elements that match the given requisites.
            Use #gst_plugin_feature_list_free after usage.
  */
  static gid.gst1.element_factory.ElementFactory[] listFilter(gid.gst1.element_factory.ElementFactory[] list, gid.gst1.caps.Caps caps, gid.gst1.types.PadDirection direction, bool subsetonly) nothrow
  {
    GList* _cretval;
    auto _list = gListFromD!(gid.gst1.element_factory.ElementFactory)(list);
    scope(exit) containerFree!(GList*, gid.gst1.element_factory.ElementFactory, GidOwnership.None)(_list);
    _cretval = gst_element_factory_list_filter(_list, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null, direction, subsetonly);
    auto _retval = gListToD!(gid.gst1.element_factory.ElementFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get a list of factories that match the given type. Only elements
      with a rank greater or equal to minrank will be returned.
      The list of factories is returned by decreasing rank.
  
      Params:
        type = a #GstElementFactoryListType
        minrank = Minimum rank
      Returns: a #GList of
            #GstElementFactory elements. Use [gid.gst1.plugin_feature.PluginFeature.listFree] after
            usage.
  */
  static gid.gst1.element_factory.ElementFactory[] listGetElements(gid.gst1.types.ElementFactoryListType type, gid.gst1.types.Rank minrank) nothrow
  {
    GList* _cretval;
    _cretval = gst_element_factory_list_get_elements(type, minrank);
    auto _retval = gListToD!(gid.gst1.element_factory.ElementFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Create a new element of the type defined by the given element factory.
      If name is null, then the element will receive a guaranteed unique name,
      consisting of the element factory name and a number.
      If name is given, it will be given the name supplied.
  
      Params:
        factoryname = a named factory to instantiate
        name = name of new element, or null to automatically create
             a unique name
      Returns: new #GstElement or null
        if unable to create element
  */
  static gid.gst1.element.Element make(string factoryname, string name = null) nothrow
  {
    GstElement* _cretval;
    const(char)* _factoryname = factoryname.toCString!(No.Malloc, No.Nullable);
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_element_factory_make(_factoryname, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Create a new element of the type defined by the given elementfactory.
      The supplied list of properties, will be passed at object construction.
  
      Params:
        factoryname = a named factory to instantiate
        names = array of properties names
        values = array of associated properties values
      Returns: new #GstElement or null
            if the element couldn't be created
  */
  static gid.gst1.element.Element makeWithProperties(string factoryname, string[] names = null, gid.gobject2.value.Value[] values = null) nothrow
  {
    GstElement* _cretval;
    const(char)* _factoryname = factoryname.toCString!(No.Malloc, No.Nullable);
    uint _n;
    if (names)
      _n = cast(uint)names.length;

    auto _names_arr = new char*[](names.length);
    auto _names = cast(char**)_names_arr.ptr;
    foreach (i, s; names) _names[i] = s.toCString!(No.Malloc);
    if (values)
      _n = cast(uint)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    _cretval = gst_element_factory_make_with_properties(_factoryname, _n, _names, _values);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if the factory can sink all possible capabilities.
  
      Params:
        caps = the caps to check
      Returns: true if the caps are fully compatible.
  */
  bool canSinkAllCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_element_factory_can_sink_all_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the factory can sink any possible capability.
  
      Params:
        caps = the caps to check
      Returns: true if the caps have a common subset.
  */
  bool canSinkAnyCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_element_factory_can_sink_any_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the factory can src all possible capabilities.
  
      Params:
        caps = the caps to check
      Returns: true if the caps are fully compatible.
  */
  bool canSrcAllCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_element_factory_can_src_all_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the factory can src any possible capability.
  
      Params:
        caps = the caps to check
      Returns: true if the caps have a common subset.
  */
  bool canSrcAnyCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_element_factory_can_src_any_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Create a new element of the type defined by the given elementfactory.
      It will be given the name supplied, since all elements require a name as
      their first argument.
  
      Params:
        name = name of new element, or null to automatically create
             a unique name
      Returns: new #GstElement or null
            if the element couldn't be created
  */
  gid.gst1.element.Element create(string name = null) nothrow
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_element_factory_create(cast(GstElementFactory*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Create a new element of the type defined by the given elementfactory.
      The supplied list of properties, will be passed at object construction.
  
      Params:
        names = array of properties names
        values = array of associated properties values
      Returns: new #GstElement or null
            if the element couldn't be created
  */
  gid.gst1.element.Element createWithProperties(string[] names = null, gid.gobject2.value.Value[] values = null) nothrow
  {
    GstElement* _cretval;
    uint _n;
    if (names)
      _n = cast(uint)names.length;

    auto _names_arr = new char*[](names.length);
    auto _names = cast(char**)_names_arr.ptr;
    foreach (i, s; names) _names[i] = s.toCString!(No.Malloc);
    if (values)
      _n = cast(uint)values.length;

    auto _values_arr = new GValue[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    _cretval = gst_element_factory_create_with_properties(cast(GstElementFactory*)this._cPtr, _n, _names, _values);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GType for elements managed by this factory. The type can
      only be retrieved if the element factory is loaded, which can be
      assured with [gid.gst1.plugin_feature.PluginFeature.load].
      Returns: the #GType for elements managed by this factory or 0 if
        the factory is not loaded.
  */
  gid.gobject2.types.GType getElementType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gst_element_factory_get_element_type(cast(GstElementFactory*)this._cPtr);
    return _retval;
  }

  /**
      Get the metadata on factory with key.
  
      Params:
        key = a key
      Returns: the metadata with key on factory or null
        when there was no metadata with the given key.
  */
  string getMetadata(string key) nothrow
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_element_factory_get_metadata(cast(GstElementFactory*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the available keys for the metadata on factory.
      Returns: a null-terminated array of key strings, or null when there is no
        metadata. Free with [gid.glib2.global.strfreev] when no longer needed.
  */
  string[] getMetadataKeys() nothrow
  {
    char** _cretval;
    _cretval = gst_element_factory_get_metadata_keys(cast(GstElementFactory*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the number of pad_templates in this factory.
      Returns: the number of pad_templates
  */
  uint getNumPadTemplates() nothrow
  {
    uint _retval;
    _retval = gst_element_factory_get_num_pad_templates(cast(GstElementFactory*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether registered element managed by factory needs to
      be excluded from documentation system or not.
      Returns: true if documentation should be skipped
  */
  bool getSkipDocumentation() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_element_factory_get_skip_documentation(cast(GstElementFactory*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GList of #GstStaticPadTemplate for this factory.
      Returns: the
            static pad templates
  */
  gid.gst1.static_pad_template.StaticPadTemplate[] getStaticPadTemplates() nothrow
  {
    const(GList)* _cretval;
    _cretval = gst_element_factory_get_static_pad_templates(cast(GstElementFactory*)this._cPtr);
    auto _retval = gListToD!(gid.gst1.static_pad_template.StaticPadTemplate, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets a null-terminated array of protocols this element supports or null if
      no protocols are supported. You may not change the contents of the returned
      array, as it is still owned by the element factory. Use [gid.glib2.global.strdupv] to
      make a copy of the protocol string array if you need to.
      Returns: the supported protocols
            or null
  */
  string[] getUriProtocols() nothrow
  {
    const(char*)* _cretval;
    _cretval = gst_element_factory_get_uri_protocols(cast(GstElementFactory*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Gets the type of URIs the element supports or #GST_URI_UNKNOWN if none.
      Returns: type of URIs this element supports
  */
  gid.gst1.types.URIType getUriType() nothrow
  {
    GstURIType _cretval;
    _cretval = gst_element_factory_get_uri_type(cast(GstElementFactory*)this._cPtr);
    gid.gst1.types.URIType _retval = cast(gid.gst1.types.URIType)_cretval;
    return _retval;
  }

  /**
      Check if factory implements the interface with name interfacename.
  
      Params:
        interfacename = an interface name
      Returns: true when factory implement the interface.
  */
  bool hasInterface(string interfacename) nothrow
  {
    bool _retval;
    const(char)* _interfacename = interfacename.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_element_factory_has_interface(cast(GstElementFactory*)this._cPtr, _interfacename);
    return _retval;
  }

  /**
      Check if factory is of the given types.
  
      Params:
        type = a #GstElementFactoryListType
      Returns: true if factory is of type.
  */
  bool listIsType(gid.gst1.types.ElementFactoryListType type) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_element_factory_list_is_type(cast(GstElementFactory*)this._cPtr, type);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.element_factory.ElementFactory]
class ElementFactoryGidBuilderImpl(T) : gid.gst1.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.element_factory.ElementFactory]
final class ElementFactoryGidBuilder : ElementFactoryGidBuilderImpl!ElementFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ElementFactory build() nothrow
  {
    return new ElementFactory(cast(void*)createGObject(ElementFactory._getGType), Yes.Take);
  }
}
