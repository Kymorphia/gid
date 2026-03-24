/// Module for [Swipeable] interface
module adw.swipeable;

public import adw.swipeable_iface_proxy;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.rectangle;
import gid.gid;
import gobject.gid_builder;

/**
    An interface for swipeable widgets.
    
    The [adw.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See `class@SwipeTracker` for details about implementing it.
*/
interface Swipeable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
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
  void getSwipeArea(adw.types.NavigationDirection navigationDirection, bool isDrag, out gdk.rectangle.Rectangle rect);
}

interface SwipeableGidBuilderImpl(T)
{
}
