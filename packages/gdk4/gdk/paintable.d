/// Module for [Paintable] interface
module gdk.paintable;

public import gdk.paintable_iface_proxy;
import gdk.c.functions;
import gdk.c.types;
import gdk.snapshot;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    [gdk.paintable.Paintable] is a simple interface used by GTK to represent content that
    can be painted.
    
    The content of a [gdk.paintable.Paintable] can be painted anywhere at any size
    without requiring any sort of layout. The interface is inspired by
    similar concepts elsewhere, such as
    [ClutterContent](https://developer.gnome.org/clutter/stable/ClutterContent.html),
    [HTML/CSS Paint Sources](https://www.w3.org/TR/css-images-4/#paint-source),
    or [SVG Paint Servers](https://www.w3.org/TR/SVG2/pservers.html).
    
    A [gdk.paintable.Paintable] can be snapshot at any time and size using
    [gdk.paintable.Paintable.snapshot]. How the paintable interprets that size and
    if it scales or centers itself into the given rectangle is implementation
    defined, though if you are implementing a [gdk.paintable.Paintable] and don't know what
    to do, it is suggested that you scale your paintable ignoring any potential
    aspect ratio.
    
    The contents that a [gdk.paintable.Paintable] produces may depend on the [gdk.snapshot.Snapshot]
    passed to it. For example, paintables may decide to use more detailed images
    on higher resolution screens or when OpenGL is available. A [gdk.paintable.Paintable]
    will however always produce the same output for the same snapshot.
    
    A [gdk.paintable.Paintable] may change its contents, meaning that it will now produce
    a different output with the same snapshot. Once that happens, it will call
    [gdk.paintable.Paintable.invalidateContents] which will emit the
    `signal@Gdk.Paintable::invalidate-contents` signal. If a paintable is known
    to never change its contents, it will set the [gdk.types.PaintableFlags.Contents]
    flag. If a consumer cannot deal with changing contents, it may call
    [gdk.paintable.Paintable.getCurrentImage] which will return a static
    paintable and use that.
    
    A paintable can report an intrinsic (or preferred) size or aspect ratio it
    wishes to be rendered at, though it doesn't have to. Consumers of the interface
    can use this information to layout thepaintable appropriately. Just like the
    contents, the size of a paintable can change. A paintable will indicate this
    by calling [gdk.paintable.Paintable.invalidateSize] which will emit the
    `signal@Gdk.Paintable::invalidate-size` signal. And just like for contents,
    if a paintable is known to never change its size, it will set the
    [gdk.types.PaintableFlags.Size] flag.
    
    Besides API for applications, there are some functions that are only
    useful for implementing subclasses and should not be used by applications:
    [gdk.paintable.Paintable.invalidateContents],
    [gdk.paintable.Paintable.invalidateSize],
    [gdk.paintable.Paintable.newEmpty].
*/
interface Paintable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_paintable_get_type != &gidSymbolNotFound ? gdk_paintable_get_type() : cast(GType)0;
  }

  /**
      Returns a paintable that has the given intrinsic size and draws nothing.
      
      This is often useful for implementing the
      `vfuncGdk.Paintable.get_current_image` virtual function
      when the paintable is in an incomplete state (like a
      [GtkMediaStream](../gtk4/class.MediaStream.html) before receiving
      the first frame).
  
      Params:
        intrinsicWidth = The intrinsic width to report. Can be 0 for no width.
        intrinsicHeight = The intrinsic height to report. Can be 0 for no height.
      Returns: a [gdk.paintable.Paintable]
  */
  static gdk.paintable.Paintable newEmpty(int intrinsicWidth, int intrinsicHeight)
  {
    GdkPaintable* _cretval;
    _cretval = gdk_paintable_new_empty(intrinsicWidth, intrinsicHeight);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Compute a concrete size for the [gdk.paintable.Paintable].
      
      Applies the sizing algorithm outlined in the
      [CSS Image spec](https://drafts.csswg.org/css-images-3/#default-sizing)
      to the given paintable. See that link for more details.
      
      It is not necessary to call this function when both specified_width
      and specified_height are known, but it is useful to call this
      function in GtkWidget:measure implementations to compute the
      other dimension when only one dimension is given.
  
      Params:
        specifiedWidth = the width paintable could be drawn into or
            0.0 if unknown
        specifiedHeight = the height paintable could be drawn into or
            0.0 if unknown
        defaultWidth = the width paintable would be drawn into if
            no other constraints were given
        defaultHeight = the height paintable would be drawn into if
            no other constraints were given
        concreteWidth = will be set to the concrete width computed
        concreteHeight = will be set to the concrete height computed
  */
  void computeConcreteSize(double specifiedWidth, double specifiedHeight, double defaultWidth, double defaultHeight, out double concreteWidth, out double concreteHeight);

  /**
      Gets an immutable paintable for the current contents displayed by paintable.
      
      This is useful when you want to retain the current state of an animation,
      for example to take a screenshot of a running animation.
      
      If the paintable is already immutable, it will return itself.
      Returns: An immutable paintable for the current
          contents of paintable
  */
  gdk.paintable.Paintable getCurrentImage();

  /**
      Get flags for the paintable.
      
      This is oftentimes useful for optimizations.
      
      See [gdk.types.PaintableFlags] for the flags and what they mean.
      Returns: The [gdk.types.PaintableFlags] for this paintable
  */
  gdk.types.PaintableFlags getFlags();

  /**
      Gets the preferred aspect ratio the paintable would like to be displayed at.
      
      The aspect ratio is the width divided by the height, so a value of 0.5
      means that the paintable prefers to be displayed twice as high as it
      is wide. Consumers of this interface can use this to preserve aspect
      ratio when displaying the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gdk.paintable.Paintable.snapshot].
      
      Usually when a paintable returns nonzero values from
      [gdk.paintable.Paintable.getIntrinsicWidth] and
      [gdk.paintable.Paintable.getIntrinsicHeight] the aspect ratio
      should conform to those values, though that is not required.
      
      If the paintable does not have a preferred aspect ratio,
      it returns 0. Negative values are never returned.
      Returns: the intrinsic aspect ratio of paintable or 0 if none.
  */
  double getIntrinsicAspectRatio();

  /**
      Gets the preferred height the paintable would like to be displayed at.
      
      Consumers of this interface can use this to reserve enough space to draw
      the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gdk.paintable.Paintable.snapshot].
      
      If the paintable does not have a preferred height, it returns 0.
      Negative values are never returned.
      Returns: the intrinsic height of paintable or 0 if none.
  */
  int getIntrinsicHeight();

  /**
      Gets the preferred width the paintable would like to be displayed at.
      
      Consumers of this interface can use this to reserve enough space to draw
      the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gdk.paintable.Paintable.snapshot].
      
      If the paintable does not have a preferred width, it returns 0.
      Negative values are never returned.
      Returns: the intrinsic width of paintable or 0 if none.
  */
  int getIntrinsicWidth();

  /**
      Called by implementations of [gdk.paintable.Paintable] to invalidate their contents.
      
      Unless the contents are invalidated, implementations must guarantee that
      multiple calls of [gdk.paintable.Paintable.snapshot] produce the same output.
      
      This function will emit the `signalGdk.Paintable::invalidate-contents`
      signal.
      
      If a paintable reports the [gdk.types.PaintableFlags.Contents] flag,
      it must not call this function.
  */
  void invalidateContents();

  /**
      Called by implementations of [gdk.paintable.Paintable] to invalidate their size.
      
      As long as the size is not invalidated, paintable must return the same
      values for its intrinsic width, height and aspect ratio.
      
      This function will emit the `signalGdk.Paintable::invalidate-size`
      signal.
      
      If a paintable reports the [gdk.types.PaintableFlags.Size] flag,
      it must not call this function.
  */
  void invalidateSize();

  /**
      Snapshots the given paintable with the given width and height.
      
      The paintable is drawn at the current (0,0) offset of the snapshot.
      If width and height are not larger than zero, this function will
      do nothing.
  
      Params:
        snapshot = a [gdk.snapshot.Snapshot] to snapshot to
        width = width to snapshot in
        height = height to snapshot in
  */
  void snapshot(gdk.snapshot.Snapshot snapshot, double width, double height);

  /**
      Connect to `InvalidateContents` signal.
  
      Emitted when the contents of the paintable change.
        
        Examples for such an event would be videos changing to the next frame or
        the icon theme for an icon changing.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.paintable.Paintable paintable))
  
          `paintable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInvalidateContents(T)(T callback, Flag!"After" after = No.After);

  /**
      Connect to `InvalidateSize` signal.
  
      Emitted when the intrinsic size of the paintable changes.
        
        This means the values reported by at least one of
        [gdk.paintable.Paintable.getIntrinsicWidth],
        [gdk.paintable.Paintable.getIntrinsicHeight] or
        [gdk.paintable.Paintable.getIntrinsicAspectRatio]
        has changed.
        
        Examples for such an event would be a paintable displaying
        the contents of a toplevel surface being resized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.paintable.Paintable paintable))
  
          `paintable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInvalidateSize(T)(T callback, Flag!"After" after = No.After);
}
