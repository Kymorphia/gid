/// Module for [Swipeable] interface mixin
module gid.adw1.swipeable_mixin;

public import gid.core.basictypes;
public import gid.adw1.swipeable_iface_proxy;
public import gid.adw1.c.functions;
public import gid.adw1.c.types;
public import gid.adw1.types;
public import gid.core.gid;
public import gid.gdk4.rectangle;
public import gid.gobject2.gid_builder;

/**
    An interface for swipeable widgets.
    
    The [gid.adw1.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See [gid.adw1.swipe_tracker.SwipeTracker] for details about implementing it.
*/
template SwipeableT()
{

  /**
      Gets the progress self will snap back to after the gesture is canceled.
      Returns: the cancel progress, unitless
  */
  override double getCancelProgress() nothrow
  {
    double _retval;
    _retval = adw_swipeable_get_cancel_progress(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the swipe distance of self.
      
      This corresponds to how many pixels 1 unit represents.
      Returns: the swipe distance in pixels
  */
  override double getDistance() nothrow
  {
    double _retval;
    _retval = adw_swipeable_get_distance(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current progress of self.
      Returns: the current progress, unitless
  */
  override double getProgress() nothrow
  {
    double _retval;
    _retval = adw_swipeable_get_progress(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the snap points of self.
      
      Each snap point represents a progress value that is considered acceptable to
      end the swipe on.
      Returns: the snap points
  */
  override double[] getSnapPoints() nothrow
  {
    double* _cretval;
    int _cretlength;
    _cretval = adw_swipeable_get_snap_points(cast(AdwSwipeable*)this._cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the area self can start a swipe from for the given direction and
      gesture type.
      
      This can be used to restrict swipes to only be possible from a certain area,
      for example, to only allow edge swipes, or to have a draggable element and
      ignore swipes elsewhere.
      
      If not implemented, the default implementation returns the allocation of
      self, allowing swipes from anywhere.
  
      Params:
        navigationDirection = the direction of the swipe
        isDrag = whether the swipe is caused by a dragging gesture
        rect = a pointer to a rectangle to store the swipe area
  */
  override void getSwipeArea(gid.adw1.types.NavigationDirection navigationDirection, bool isDrag, out gid.gdk4.rectangle.Rectangle rect) nothrow
  {
    adw_swipeable_get_swipe_area(cast(AdwSwipeable*)this._cPtr, navigationDirection, isDrag, cast(GdkRectangle*)&rect);
  }
}

/// Fluent builder implementation template for [gid.adw1.swipeable.Swipeable]
template SwipeableGidBuilderT()
{
}
