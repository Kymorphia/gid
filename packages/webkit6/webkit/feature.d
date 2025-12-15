/// Module for [Feature] class
module webkit.feature;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Describes a web engine feature that may be toggled at runtime.
    
    The WebKit web engine includes a set of features which may be toggled
    programmatically, each one represented by a #WebKitFeature that provides
    information about it:
    
    $(LIST
      * A unique “identifier”: [webkit.feature.Feature.getIdentifier].
      * A “default value”, which indicates whether the option is enabled
        automatically: [webkit.feature.Feature.getDefaultValue].
      * Its “status”, which determines whether it should be considered
        user-settable and its development stage (see `enum@FeatureStatus`
        for details): [webkit.feature.Feature.getStatus].
      * A category, which may be used to group features together:
        [webkit.feature.Feature.getCategory].
      * An optional short “name” which can be presented to an user:
        [webkit.feature.Feature.getName].
      * An optional longer “detailed” description:
        [webkit.feature.Feature.getDetails].
    )
      
    The lists of available features can be obtained with
    [webkit.settings.Settings.getAllFeatures], [webkit.settings.Settings.getExperimentalFeatures],
    and [webkit.settings.Settings.getDevelopmentFeatures]). As a rule of thumb,
    applications which may want to allow users (i.e. web developers) to test
    WebKit features should use the list of experimental features. Additionally,
    applications might want to expose development features *when targeting
    technically inclined users* for early testing of in-development features
    (i.e. in “technology preview” or “canary” builds).
    
    Applications **must not** expose the list of all features to end users
    because they often lack descriptions and control parts of the web engine
    which are either intended to be used during development of WebKit itself,
    or in specific scenarios to tweak how WebKit integrates with the
    application.
*/
class Feature : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_feature_get_type != &gidSymbolNotFound ? webkit_feature_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Feature self()
  {
    return this;
  }

  /**
      Gets the category of the feature.
      
      Applications which include user interface to toggle features may want
      to use the category to group related features together.
      Returns: Feature category.
  */
  string getCategory()
  {
    const(char)* _cretval;
    _cretval = webkit_feature_get_category(cast(WebKitFeature*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the feature is enabled by default.
      
      The default value may be used by applications which include user interface
      to toggle features to restore its settings to their defaults. Note that
      whether a feature is actually enabled must be checked with
      [webkit.settings.Settings.getFeatureEnabled].
      Returns: Whether the feature is enabled by default.
  */
  bool getDefaultValue()
  {
    bool _retval;
    _retval = cast(bool)webkit_feature_get_default_value(cast(WebKitFeature*)this._cPtr);
    return _retval;
  }

  /**
      Gets a description for the feature.
      
      The detailed description should be considered an additional clarification
      on the purpose of the feature, to be used as complementary aid to be
      displayed along the feature name returned by [webkit.feature.Feature.getName].
      The returned string is suitable to be displayed to end users, but it
      should not be relied upon being localized.
      
      Note that some *features may not* have a detailed description, and NULL
      is returned in this case.
      Returns: Feature description.
  */
  string getDetails()
  {
    const(char)* _cretval;
    _cretval = webkit_feature_get_details(cast(WebKitFeature*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a string that uniquely identifies the feature.
      Returns: The identifier string for the feature.
  */
  string getIdentifier()
  {
    const(char)* _cretval;
    _cretval = webkit_feature_get_identifier(cast(WebKitFeature*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a short name for the feature.
      
      The returned string is suitable to be displayed to end users, but it
      should not be relied upon being localized.
      
      Note that some *features may not* have a short name, and NULL
      is returned in this case.
      Returns: Short feature name.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_feature_get_name(cast(WebKitFeature*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the status of the feature.
      Returns: Feature status.
  */
  webkit.types.FeatureStatus getStatus()
  {
    WebKitFeatureStatus _cretval;
    _cretval = webkit_feature_get_status(cast(WebKitFeature*)this._cPtr);
    webkit.types.FeatureStatus _retval = cast(webkit.types.FeatureStatus)_cretval;
    return _retval;
  }
}
