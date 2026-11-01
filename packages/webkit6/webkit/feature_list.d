/// Module for [FeatureList] class
module webkit.feature_list;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.feature;
import webkit.types;

/**
    Contains a set of toggle-able web engine features.
    
    The list supports passing around a set of [webkit.feature.Feature] objects and
    iterating over them:
    
    ```c
    g_autoptr(WebKitFeatureList) list = webkit_settings_get_experimental_features();
    for (gsize i = 0; i < webkit_feature_list_get_length(list): i++) {
        WebKitFeature *feature = webkit_feature_list_get(list, i);
        // Do something with "feature".
    }
    ```
    
    Lists of features can be obtained with
    [webkit.settings.Settings.getExperimentalFeatures],
    [webkit.settings.Settings.getDevelopmentFeatures], and
    [webkit.settings.Settings.getAllFeatures].
*/
class FeatureList : gobject.boxed.BoxedWrap!(webkit_feature_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override FeatureList self() nothrow
  {
    return this;
  }

  /**
      Gets a feature given its index.
  
      Params:
        index = index of the feature
      Returns: The feature at index.
  */
  webkit.feature.Feature get(size_t index) nothrow
  {
    WebKitFeature* _cretval;
    _cretval = webkit_feature_list_get(cast(WebKitFeatureList*)this._cPtr, index);
    auto _retval = _cretval ? new webkit.feature.Feature(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the number of elements in the feature list.
      Returns: number of elements.
        
        Since 2.42
  */
  size_t getLength() nothrow
  {
    size_t _retval;
    _retval = webkit_feature_list_get_length(cast(WebKitFeatureList*)this._cPtr);
    return _retval;
  }
}
