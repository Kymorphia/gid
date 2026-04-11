/// Module for [Visual] class
module gdk.visual;

import gdk.c.functions;
import gdk.c.types;
import gdk.screen;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A #GdkVisual contains information about
    a particular visual.
*/
class Visual : gobject.object.ObjectWrap
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
    return cast(void function())gdk_visual_get_type != &gidSymbolNotFound ? gdk_visual_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Visual self()
  {
    return this;
  }

  /**
      Get builder for [gdk.visual.Visual]
      Returns: New builder object
  */
  static VisualGidBuilder builder()
  {
    return new VisualGidBuilder;
  }

  /**
      Get the visual with the most available colors for the default
      GDK screen. The return value should not be freed.
      Returns: best visual
  
      Deprecated: Visual selection should be done using
            [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
  */
  static gdk.visual.Visual getBest()
  {
    GdkVisual* _cretval;
    _cretval = gdk_visual_get_best();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the best available depth for the default GDK screen.  “Best”
      means “largest,” i.e. 32 preferred over 24 preferred over 8 bits
      per pixel.
      Returns: best available depth
  
      Deprecated: Visual selection should be done using
            [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
  */
  static int getBestDepth()
  {
    int _retval;
    _retval = gdk_visual_get_best_depth();
    return _retval;
  }

  /**
      Return the best available visual type for the default GDK screen.
      Returns: best visual type
  
      Deprecated: Visual selection should be done using
            [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
  */
  static gdk.types.VisualType getBestType()
  {
    GdkVisualType _cretval;
    _cretval = gdk_visual_get_best_type();
    gdk.types.VisualType _retval = cast(gdk.types.VisualType)_cretval;
    return _retval;
  }

  /**
      Combines [gdk.visual.Visual.getBestWithDepth] and
      [gdk.visual.Visual.getBestWithType].
  
      Params:
        depth = a bit depth
        visualType = a visual type
      Returns: best visual with both depth
            and visual_type, or null if none
  
      Deprecated: Visual selection should be done using
            [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
  */
  static gdk.visual.Visual getBestWithBoth(int depth, gdk.types.VisualType visualType)
  {
    GdkVisual* _cretval;
    _cretval = gdk_visual_get_best_with_both(depth, visualType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the best visual with depth depth for the default GDK screen.
      Color visuals and visuals with mutable colormaps are preferred
      over grayscale or fixed-colormap visuals. The return value should
      not be freed. null may be returned if no visual supports depth.
  
      Params:
        depth = a bit depth
      Returns: best visual for the given depth
  
      Deprecated: Visual selection should be done using
            [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
  */
  static gdk.visual.Visual getBestWithDepth(int depth)
  {
    GdkVisual* _cretval;
    _cretval = gdk_visual_get_best_with_depth(depth);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the best visual of the given visual_type for the default GDK screen.
      Visuals with higher color depths are considered better. The return value
      should not be freed. null may be returned if no visual has type
      visual_type.
  
      Params:
        visualType = a visual type
      Returns: best visual of the given type
  
      Deprecated: Visual selection should be done using
            [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
  */
  static gdk.visual.Visual getBestWithType(gdk.types.VisualType visualType)
  {
    GdkVisual* _cretval;
    _cretval = gdk_visual_get_best_with_type(visualType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the system’s default visual for the default GDK screen.
      This is the visual for the root window of the display.
      The return value should not be freed.
      Returns: system visual
  
      Deprecated: Use gdk_screen_get_system_visual (gdk_screen_get_default ()).
  */
  static gdk.visual.Visual getSystem()
  {
    GdkVisual* _cretval;
    _cretval = gdk_visual_get_system();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the number of significant bits per red, green and blue value.
      
      Not all GDK backend provide a meaningful value for this function.
      Returns: The number of significant bits per color value for visual.
  
      Deprecated: Use [gdk.visual.Visual.getRedPixelDetails] and its variants to
            learn about the pixel layout of TrueColor and DirectColor visuals
  */
  int getBitsPerRgb()
  {
    int _retval;
    _retval = gdk_visual_get_bits_per_rgb(cast(GdkVisual*)this._cPtr);
    return _retval;
  }

  /**
      Obtains values that are needed to calculate blue pixel values in TrueColor
      and DirectColor. The “mask” is the significant bits within the pixel.
      The “shift” is the number of bits left we must shift a primary for it
      to be in position (according to the "mask"). Finally, "precision" refers
      to how much precision the pixel value contains for a particular primary.
  
      Params:
        mask = A pointer to a #guint32 to be filled in, or null
        shift = A pointer to a #gint to be filled in, or null
        precision = A pointer to a #gint to be filled in, or null
  */
  void getBluePixelDetails(out uint mask, out int shift, out int precision)
  {
    gdk_visual_get_blue_pixel_details(cast(GdkVisual*)this._cPtr, cast(uint*)&mask, cast(int*)&shift, cast(int*)&precision);
  }

  /**
      Returns the byte order of this visual.
      
      The information returned by this function is only relevant
      when working with XImages, and not all backends return
      meaningful information for this.
      Returns: A #GdkByteOrder stating the byte order of visual.
  
      Deprecated: This information is not useful
  */
  gdk.types.ByteOrder getByteOrder()
  {
    GdkByteOrder _cretval;
    _cretval = gdk_visual_get_byte_order(cast(GdkVisual*)this._cPtr);
    gdk.types.ByteOrder _retval = cast(gdk.types.ByteOrder)_cretval;
    return _retval;
  }

  /**
      Returns the size of a colormap for this visual.
      
      You have to use platform-specific APIs to manipulate colormaps.
      Returns: The size of a colormap that is suitable for visual.
  
      Deprecated: This information is not useful, since GDK does not
            provide APIs to operate on colormaps.
  */
  int getColormapSize()
  {
    int _retval;
    _retval = gdk_visual_get_colormap_size(cast(GdkVisual*)this._cPtr);
    return _retval;
  }

  /**
      Returns the bit depth of this visual.
      Returns: The bit depth of this visual.
  */
  int getDepth()
  {
    int _retval;
    _retval = gdk_visual_get_depth(cast(GdkVisual*)this._cPtr);
    return _retval;
  }

  /**
      Obtains values that are needed to calculate green pixel values in TrueColor
      and DirectColor. The “mask” is the significant bits within the pixel.
      The “shift” is the number of bits left we must shift a primary for it
      to be in position (according to the "mask"). Finally, "precision" refers
      to how much precision the pixel value contains for a particular primary.
  
      Params:
        mask = A pointer to a #guint32 to be filled in, or null
        shift = A pointer to a #gint to be filled in, or null
        precision = A pointer to a #gint to be filled in, or null
  */
  void getGreenPixelDetails(out uint mask, out int shift, out int precision)
  {
    gdk_visual_get_green_pixel_details(cast(GdkVisual*)this._cPtr, cast(uint*)&mask, cast(int*)&shift, cast(int*)&precision);
  }

  /**
      Obtains values that are needed to calculate red pixel values in TrueColor
      and DirectColor. The “mask” is the significant bits within the pixel.
      The “shift” is the number of bits left we must shift a primary for it
      to be in position (according to the "mask"). Finally, "precision" refers
      to how much precision the pixel value contains for a particular primary.
  
      Params:
        mask = A pointer to a #guint32 to be filled in, or null
        shift = A pointer to a #gint to be filled in, or null
        precision = A pointer to a #gint to be filled in, or null
  */
  void getRedPixelDetails(out uint mask, out int shift, out int precision)
  {
    gdk_visual_get_red_pixel_details(cast(GdkVisual*)this._cPtr, cast(uint*)&mask, cast(int*)&shift, cast(int*)&precision);
  }

  /**
      Gets the screen to which this visual belongs
      Returns: the screen to which this visual belongs.
  */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gdk_visual_get_screen(cast(GdkVisual*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the type of visual this is (PseudoColor, TrueColor, etc).
      Returns: A #GdkVisualType stating the type of visual.
  */
  gdk.types.VisualType getVisualType()
  {
    GdkVisualType _cretval;
    _cretval = gdk_visual_get_visual_type(cast(GdkVisual*)this._cPtr);
    gdk.types.VisualType _retval = cast(gdk.types.VisualType)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gdk.visual.Visual]
class VisualGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gdk.visual.Visual]
final class VisualGidBuilder : VisualGidBuilderImpl!VisualGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Visual build()
  {
    return new Visual(cast(void*)createGObject(Visual._getGType), No.Take);
  }
}
