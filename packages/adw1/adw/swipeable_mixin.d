/// Module for [Swipeable] interface mixin
module adw.swipeable_mixin;

public import adw.swipeable_iface_proxy;
public import adw.c.functions;
public import adw.c.types;
public import adw.types;
public import gdk.rectangle;
public import gid.gid;

/**
    An interface for swipeable widgets.
    
    The [adw.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See `class@SwipeTracker` for details about implementing it.
*/
template SwipeableT()
{

  /**
      Gets the progress self will snap back to after the gesture is canceled.
      Returns: the cancel progress, unitless
  */
  override double getCancelProgress()
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
  override double getDistance()
  {
    double _retval;
    _retval = adw_swipeable_get_distance(cast(AdwSwipeable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current progress of self.
      Returns: the current progress, unitless
  */
  override double getProgress()
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
  override double[] getSnapPoints()
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
  override void getSwipeArea(adw.types.NavigationDirection navigationDirection, bool isDrag, out gdk.rectangle.Rectangle rect)
  {
    GdkRectangle _rect;
    adw_swipeable_get_swipe_area(cast(AdwSwipeable*)this._cPtr, navigationDirection, isDrag, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
  }
}
