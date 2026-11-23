/// Module for [Swipeable] interface
module gid.adw1.swipeable;

public import gid.core.basictypes;
public import gid.adw1.swipeable_iface_proxy;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gdk4.rectangle;
import gid.gobject2.gid_builder;

/**
    An interface for swipeable widgets.
    
    The [gid.adw1.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See [gid.adw1.swipe_tracker.SwipeTracker] for details about implementing it.
*/
interface Swipeable : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_swipeable_get_type != &gidSymbolNotFound ? adw_swipeable_get_type() : cast(GType)0;
  }






  /**
      Gets the progress self will snap back to after the gesture is canceled.
      Returns: the cancel progress, unitless
  */
  double getCancelProgress();

  /**
      Gets the swipe distance of self.
      
      This corresponds to how many pixels 1 unit represents.
      Returns: the swipe distance in pixels
  */
  double getDistance();

  /**
      Gets the current progress of self.
      Returns: the current progress, unitless
  */
  double getProgress();

  /**
      Gets the snap points of self.
      
      Each snap point represents a progress value that is considered acceptable to
      end the swipe on.
      Returns: the snap points
  */
  double[] getSnapPoints();

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
  void getSwipeArea(gid.adw1.types.NavigationDirection navigationDirection, bool isDrag, out gid.gdk4.rectangle.Rectangle rect);
}

/// Fluent builder implementation template for [gid.adw1.swipeable.Swipeable]
interface SwipeableGidBuilderImpl(T)
{
}
