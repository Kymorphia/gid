/// Module for [ElementFactory] class
module gst.element_factory;

import gid.gid;
import gobject.object;
import gobject.types;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.element;
import gst.plugin_feature;
import gst.types;

/**
    #GstElementFactory is used to create instances of elements. A
    GstElementFactory can be added to a #GstPlugin as it is also a
    #GstPluginFeature.
    
    Use the [gst.element_factory.ElementFactory.find] and [gst.element_factory.ElementFactory.create]
    functions to create element instances or use [gst.element_factory.ElementFactory.make] as a
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
class ElementFactory : gst.plugin_feature.PluginFeature
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
    return cast(void function())gst_element_factory_get_type != &gidSymbolNotFound ? gst_element_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ElementFactory self()
  {
    return this;
  }

  /**
      Search for an element factory of the given name. Refs the returned
      element factory; caller is responsible for unreffing.
  
      Params:
        name = name of factory to find
      Returns: #GstElementFactory if found,
        null otherwise
  */
  static gst.element_factory.ElementFactory find(string name)
  {
    GstElementFactory* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_factory_find(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element_factory.ElementFactory)(cast(GstElementFactory*)_cretval, Yes.Take);
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
  static gst.element_factory.ElementFactory[] listFilter(gst.element_factory.ElementFactory[] list, gst.caps.Caps caps, gst.types.PadDirection direction, bool subsetonly)
  {
    GList* _cretval;
    auto _list = gListFromD!(gst.element_factory.ElementFactory)(list);
    scope(exit) containerFree!(GList*, gst.element_factory.ElementFactory, GidOwnership.None)(_list);
    _cretval = gst_element_factory_list_filter(_list, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null, direction, subsetonly);
    auto _retval = gListToD!(gst.element_factory.ElementFactory, GidOwnership.Full)(cast(GList*)_cretval);
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
            #GstElementFactory elements. Use [gst.plugin_feature.PluginFeature.listFree] after
            usage.
  */
  static gst.element_factory.ElementFactory[] listGetElements(gst.types.ElementFactoryListType type, gst.types.Rank minrank)
  {
    GList* _cretval;
    _cretval = gst_element_factory_list_get_elements(type, minrank);
    auto _retval = gListToD!(gst.element_factory.ElementFactory, GidOwnership.Full)(cast(GList*)_cretval);
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
  static gst.element.Element make(string factoryname, string name = null)
  {
    GstElement* _cretval;
    const(char)* _factoryname = factoryname.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_factory_make(_factoryname, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
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
  static gst.element.Element makeWithProperties(string factoryname, string[] names = null, gobject.value.Value[] values = null)
  {
    GstElement* _cretval;
    const(char)* _factoryname = factoryname.toCString(No.Alloc);
    uint _n;
    if (names)
      _n = cast(uint)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    const(char*)* _names = _tmpnames.ptr;

    if (values)
      _n = cast(uint)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj._cPtr;
    const(GValue)* _values = _tmpvalues.ptr;
    _cretval = gst_element_factory_make_with_properties(_factoryname, _n, _names, _values);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if the factory can sink all possible capabilities.
  
      Params:
        caps = the caps to check
      Returns: true if the caps are fully compatible.
  */
  bool canSinkAllCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = gst_element_factory_can_sink_all_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the factory can sink any possible capability.
  
      Params:
        caps = the caps to check
      Returns: true if the caps have a common subset.
  */
  bool canSinkAnyCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = gst_element_factory_can_sink_any_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the factory can src all possible capabilities.
  
      Params:
        caps = the caps to check
      Returns: true if the caps are fully compatible.
  */
  bool canSrcAllCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = gst_element_factory_can_src_all_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if the factory can src any possible capability.
  
      Params:
        caps = the caps to check
      Returns: true if the caps have a common subset.
  */
  bool canSrcAnyCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = gst_element_factory_can_src_any_caps(cast(GstElementFactory*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
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
  gst.element.Element create(string name = null)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_factory_create(cast(GstElementFactory*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
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
  gst.element.Element createWithProperties(string[] names = null, gobject.value.Value[] values = null)
  {
    GstElement* _cretval;
    uint _n;
    if (names)
      _n = cast(uint)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    const(char*)* _names = _tmpnames.ptr;

    if (values)
      _n = cast(uint)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj._cPtr;
    const(GValue)* _values = _tmpvalues.ptr;
    _cretval = gst_element_factory_create_with_properties(cast(GstElementFactory*)this._cPtr, _n, _names, _values);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #GType for elements managed by this factory. The type can
      only be retrieved if the element factory is loaded, which can be
      assured with [gst.plugin_feature.PluginFeature.load].
      Returns: the #GType for elements managed by this factory or 0 if
        the factory is not loaded.
  */
  gobject.types.GType getElementType()
  {
    gobject.types.GType _retval;
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
  string getMetadata(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_element_factory_get_metadata(cast(GstElementFactory*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the available keys for the metadata on factory.
      Returns: a null-terminated array of key strings, or null when there is no
        metadata. Free with [glib.global.strfreev] when no longer needed.
  */
  string[] getMetadataKeys()
  {
    char** _cretval;
    _cretval = gst_element_factory_get_metadata_keys(cast(GstElementFactory*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the number of pad_templates in this factory.
      Returns: the number of pad_templates
  */
  uint getNumPadTemplates()
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
  bool getSkipDocumentation()
  {
    bool _retval;
    _retval = gst_element_factory_get_skip_documentation(cast(GstElementFactory*)this._cPtr);
    return _retval;
  }

  /**
      Gets a null-terminated array of protocols this element supports or null if
      no protocols are supported. You may not change the contents of the returned
      array, as it is still owned by the element factory. Use [glib.global.strdupv] to
      make a copy of the protocol string array if you need to.
      Returns: the supported protocols
            or null
  */
  string[] getUriProtocols()
  {
    const(char*)* _cretval;
    _cretval = gst_element_factory_get_uri_protocols(cast(GstElementFactory*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the type of URIs the element supports or #GST_URI_UNKNOWN if none.
      Returns: type of URIs this element supports
  */
  gst.types.URIType getUriType()
  {
    GstURIType _cretval;
    _cretval = gst_element_factory_get_uri_type(cast(GstElementFactory*)this._cPtr);
    gst.types.URIType _retval = cast(gst.types.URIType)_cretval;
    return _retval;
  }

  /**
      Check if factory implements the interface with name interfacename.
  
      Params:
        interfacename = an interface name
      Returns: true when factory implement the interface.
  */
  bool hasInterface(string interfacename)
  {
    bool _retval;
    const(char)* _interfacename = interfacename.toCString(No.Alloc);
    _retval = gst_element_factory_has_interface(cast(GstElementFactory*)this._cPtr, _interfacename);
    return _retval;
  }

  /**
      Check if factory is of the given types.
  
      Params:
        type = a #GstElementFactoryListType
      Returns: true if factory is of type.
  */
  bool listIsType(gst.types.ElementFactoryListType type)
  {
    bool _retval;
    _retval = gst_element_factory_list_is_type(cast(GstElementFactory*)this._cPtr, type);
    return _retval;
  }
}
