/// Module for [DevicePad] interface mixin
module gid.gdk4.device_pad_mixin;

public import gid.core.basictypes;
public import gid.gdk4.device_pad_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.c.functions;
public import gid.gdk4.c.types;
public import gid.gdk4.types;
public import gid.gobject2.gid_builder;

/**
    An interface for tablet pad devices.
    
    It allows querying the features provided by the pad device.
    
    Tablet pads may contain one or more groups, each containing a subset
    of the buttons/rings/strips available. [gid.gdk4.device_pad.DevicePad.getNGroups]
    can be used to obtain the number of groups, [gid.gdk4.device_pad.DevicePad.getNFeatures]
    and [gid.gdk4.device_pad.DevicePad.getFeatureGroup] can be combined to find out
    the number of buttons/rings/strips the device has, and how are they grouped.
    
    Each of those groups have different modes, which may be used to map each
    individual pad feature to multiple actions. Only one mode is effective
    (current) for each given group, different groups may have different
    current modes. The number of available modes in a group can be found
    out through [gid.gdk4.device_pad.DevicePad.getGroupNModes], and the current mode
    for a given group will be notified through events of type [gid.gdk4.types.EventType.PadGroupMode].
*/
template DevicePadT()
{

  /**
      Returns the group the given feature and idx belong to.
      
      f the feature or index do not exist in pad, -1 is returned.
  
      Params:
        feature = the feature type to get the group from
        featureIdx = the index of the feature to get the group from
      Returns: The group number of the queried pad feature.
  */
  override int getFeatureGroup(gid.gdk4.types.DevicePadFeature feature, int featureIdx) nothrow
  {
    int _retval;
    _retval = gdk_device_pad_get_feature_group(cast(GdkDevicePad*)this._cPtr, feature, featureIdx);
    return _retval;
  }

  /**
      Returns the number of modes that group may have.
  
      Params:
        groupIdx = group to get the number of available modes from
      Returns: The number of modes available in group.
  */
  override int getGroupNModes(int groupIdx) nothrow
  {
    int _retval;
    _retval = gdk_device_pad_get_group_n_modes(cast(GdkDevicePad*)this._cPtr, groupIdx);
    return _retval;
  }

  /**
      Returns the number of features a tablet pad has.
  
      Params:
        feature = a pad feature
      Returns: The amount of elements of type feature that this pad has.
  */
  override int getNFeatures(gid.gdk4.types.DevicePadFeature feature) nothrow
  {
    int _retval;
    _retval = gdk_device_pad_get_n_features(cast(GdkDevicePad*)this._cPtr, feature);
    return _retval;
  }

  /**
      Returns the number of groups this pad device has.
      
      Pads have at least one group. A pad group is a subcollection of
      buttons/strip/rings that is affected collectively by a same
      current mode.
      Returns: The number of button/ring/strip groups in the pad.
  */
  override int getNGroups() nothrow
  {
    int _retval;
    _retval = gdk_device_pad_get_n_groups(cast(GdkDevicePad*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk4.device_pad.DevicePad]
template DevicePadGidBuilderT()
{
}
