/// Module for [PluginFeature] class
module gst.plugin_feature;

import gid.gid;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.plugin;
import gst.types;

/**
    This is a base class for anything that can be added to a #GstPlugin.
*/
class PluginFeature : gst.object.ObjectWrap
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
    return cast(void function())gst_plugin_feature_get_type != &gidSymbolNotFound ? gst_plugin_feature_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PluginFeature self()
  {
    return this;
  }

  /**
      Copies the list of features. Caller should call gst_plugin_feature_list_free
      when done with the list.
  
      Params:
        list = list
              of #GstPluginFeature
      Returns: a copy of list,
            with each feature's reference count incremented.
  */
  static gst.plugin_feature.PluginFeature[] listCopy(gst.plugin_feature.PluginFeature[] list)
  {
    GList* _cretval;
    auto _list = gListFromD!(gst.plugin_feature.PluginFeature)(list);
    scope(exit) containerFree!(GList*, gst.plugin_feature.PluginFeature, GidOwnership.None)(_list);
    _cretval = gst_plugin_feature_list_copy(_list);
    auto _retval = gListToD!(gst.plugin_feature.PluginFeature, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Debug the plugin feature names in list.
  
      Params:
        list = a #GList of
              plugin features
  */
  static void listDebug(gst.plugin_feature.PluginFeature[] list)
  {
    auto _list = gListFromD!(gst.plugin_feature.PluginFeature)(list);
    scope(exit) containerFree!(GList*, gst.plugin_feature.PluginFeature, GidOwnership.None)(_list);
    gst_plugin_feature_list_debug(_list);
  }

  /**
      Compares the two given #GstPluginFeature instances. This function can be
      used as a #GCompareFunc when sorting by rank and then by name.
  
      Params:
        p1 = a #GstPluginFeature
        p2 = a #GstPluginFeature
      Returns: negative value if the rank of p1 > the rank of p2 or the ranks are
        equal but the name of p1 comes before the name of p2; zero if the rank
        and names are equal; positive value if the rank of p1 < the rank of p2 or the
        ranks are equal but the name of p2 comes before the name of p1
  */
  static int rankCompareFunc(const(void)* p1 = null, const(void)* p2 = null)
  {
    int _retval;
    _retval = gst_plugin_feature_rank_compare_func(p1, p2);
    return _retval;
  }

  /**
      Checks whether the given plugin feature is at least the required version.
      
      Note: Since version 1.24 this function no longer returns true if the
      version is a git development version (e.g. 1.23.0.1) and the check is
      for the "next" micro version, that is it will no longer return true for
      e.g. 1.23.0.1 if the check is for 1.23.1. It is still possible to parse
      the nano version from the string and do this check that way if needed.
  
      Params:
        minMajor = minimum required major version
        minMinor = minimum required minor version
        minMicro = minimum required micro version
      Returns: true if the plugin feature has at least
         the required version, otherwise false.
  */
  bool checkVersion(uint minMajor, uint minMinor, uint minMicro)
  {
    bool _retval;
    _retval = cast(bool)gst_plugin_feature_check_version(cast(GstPluginFeature*)this._cPtr, minMajor, minMinor, minMicro);
    return _retval;
  }

  /**
      Get the plugin that provides this feature.
      Returns: the plugin that provides this
            feature, or null.  Unref with [gst.object.ObjectWrap.unref] when no
            longer needed.
  */
  gst.plugin.Plugin getPlugin()
  {
    GstPlugin* _cretval;
    _cretval = gst_plugin_feature_get_plugin(cast(GstPluginFeature*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.plugin.Plugin)(cast(GstPlugin*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the name of the plugin that provides this feature.
      Returns: the name of the plugin that provides this
            feature, or null if the feature is not associated with a
            plugin.
  */
  string getPluginName()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_feature_get_plugin_name(cast(GstPluginFeature*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the rank of a plugin feature.
      Returns: The rank of the feature
  */
  uint getRank()
  {
    uint _retval;
    _retval = gst_plugin_feature_get_rank(cast(GstPluginFeature*)this._cPtr);
    return _retval;
  }

  /**
      Loads the plugin containing feature if it's not already loaded. feature is
      unaffected; use the return value instead.
      
      Normally this function is used like this:
      ```c
      GstPluginFeature *loaded_feature;
      
      loaded_feature = gst_plugin_feature_load (feature);
      // presumably, we're no longer interested in the potentially-unloaded feature
      gst_object_unref (feature);
      feature = loaded_feature;
      ```
      Returns: a reference to the loaded
        feature, or null on error
  */
  gst.plugin_feature.PluginFeature load()
  {
    GstPluginFeature* _cretval;
    _cretval = gst_plugin_feature_load(cast(GstPluginFeature*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.plugin_feature.PluginFeature)(cast(GstPluginFeature*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Specifies a rank for a plugin feature, so that autoplugging uses
      the most appropriate feature.
  
      Params:
        rank = rank value - higher number means more priority rank
  */
  void setRank(uint rank)
  {
    gst_plugin_feature_set_rank(cast(GstPluginFeature*)this._cPtr, rank);
  }
}
