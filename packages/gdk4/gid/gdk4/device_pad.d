/// Module for [DevicePad] interface
module gid.gdk4.device_pad;

public import gid.core.basictypes;
public import gid.gdk4.device_pad_iface_proxy;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gobject2.gid_builder;

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
interface DevicePad : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_device_pad_get_type != &gidSymbolNotFound ? gdk_device_pad_get_type() : cast(GType)0;
  }

  /**
      Returns the group the given feature and idx belong to.
      
      f the feature or index do not exist in pad, -1 is returned.
  
      Params:
        feature = the feature type to get the group from
        featureIdx = the index of the feature to get the group from
      Returns: The group number of the queried pad feature.
  */
  int getFeatureGroup(gid.gdk4.types.DevicePadFeature feature, int featureIdx);

  /**
      Returns the number of modes that group may have.
  
      Params:
        groupIdx = group to get the number of available modes from
      Returns: The number of modes available in group.
  */
  int getGroupNModes(int groupIdx);

  /**
      Returns the number of features a tablet pad has.
  
      Params:
        feature = a pad feature
      Returns: The amount of elements of type feature that this pad has.
  */
  int getNFeatures(gid.gdk4.types.DevicePadFeature feature);

  /**
      Returns the number of groups this pad device has.
      
      Pads have at least one group. A pad group is a subcollection of
      buttons/strip/rings that is affected collectively by a same
      current mode.
      Returns: The number of button/ring/strip groups in the pad.
  */
  int getNGroups();
}

/// Fluent builder implementation template for [gid.gdk4.device_pad.DevicePad]
interface DevicePadGidBuilderImpl(T)
{
}
