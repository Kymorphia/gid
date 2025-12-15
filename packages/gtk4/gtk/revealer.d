/// Module for [Revealer] class
module gtk.revealer;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    A [gtk.revealer.Revealer] animates the transition of its child from invisible to visible.
    
    The style of transition can be controlled with
    [gtk.revealer.Revealer.setTransitionType].
    
    These animations respect the `property@Gtk.Settings:gtk-enable-animations`
    setting.
    
    # CSS nodes
    
    [gtk.revealer.Revealer] has a single CSS node with name revealer.
    When styling [gtk.revealer.Revealer] using CSS, remember that it only hides its contents,
    not itself. That means applied margin, padding and borders will be visible even
    when the `property@Gtk.Revealer:reveal-child` property is set to false.
    
    # Accessibility
    
    [gtk.revealer.Revealer] uses the [gtk.types.AccessibleRole.Group] role.
    
    The child of [gtk.revealer.Revealer], if set, is always available in the accessibility
    tree, regardless of the state of the revealer widget.
*/
class Revealer : gtk.widget.Widget
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
    return cast(void function())gtk_revealer_get_type != &gidSymbolNotFound ? gtk_revealer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Revealer self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `childRevealed` property.
      Returns: Whether the child is revealed and the animation target reached.
  */
  @property bool childRevealed()
  {
    return getChildRevealed();
  }

  /**
      Get `revealChild` property.
      Returns: Whether the revealer should reveal the child.
  */
  @property bool revealChild()
  {
    return getRevealChild();
  }

  /**
      Set `revealChild` property.
      Params:
        propval = Whether the revealer should reveal the child.
  */
  @property void revealChild(bool propval)
  {
    return setRevealChild(propval);
  }

  /**
      Get `transitionDuration` property.
      Returns: The animation duration, in milliseconds.
  */
  @property uint transitionDuration()
  {
    return getTransitionDuration();
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The animation duration, in milliseconds.
  */
  @property void transitionDuration(uint propval)
  {
    return setTransitionDuration(propval);
  }

  /**
      Get `transitionType` property.
      Returns: The type of animation used to transition.
  */
  @property gtk.types.RevealerTransitionType transitionType()
  {
    return getTransitionType();
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used to transition.
  */
  @property void transitionType(gtk.types.RevealerTransitionType propval)
  {
    return setTransitionType(propval);
  }

  /**
      Creates a new [gtk.revealer.Revealer].
      Returns: a newly created [gtk.revealer.Revealer]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_revealer_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of revealer.
      Returns: the child widget of revealer
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_revealer_get_child(cast(GtkRevealer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the child is fully revealed.
      
      In other words, this returns whether the transition
      to the revealed state is completed.
      Returns: true if the child is fully revealed
  */
  bool getChildRevealed()
  {
    bool _retval;
    _retval = cast(bool)gtk_revealer_get_child_revealed(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently revealed.
      
      This function returns true as soon as the transition
      is to the revealed state is started. To learn whether
      the child is fully revealed (ie the transition is completed),
      use [gtk.revealer.Revealer.getChildRevealed].
      Returns: true if the child is revealed.
  */
  bool getRevealChild()
  {
    bool _retval;
    _retval = cast(bool)gtk_revealer_get_reveal_child(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the amount of time (in milliseconds) that
      transitions will take.
      Returns: the transition duration
  */
  uint getTransitionDuration()
  {
    uint _retval;
    _retval = gtk_revealer_get_transition_duration(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of animation that will be used
      for transitions in revealer.
      Returns: the current transition type of revealer
  */
  gtk.types.RevealerTransitionType getTransitionType()
  {
    GtkRevealerTransitionType _cretval;
    _cretval = gtk_revealer_get_transition_type(cast(GtkRevealer*)this._cPtr);
    gtk.types.RevealerTransitionType _retval = cast(gtk.types.RevealerTransitionType)_cretval;
    return _retval;
  }

  /**
      Sets the child widget of revealer.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_revealer_set_child(cast(GtkRevealer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Tells the [gtk.revealer.Revealer] to reveal or conceal its child.
      
      The transition will be animated with the current
      transition type of revealer.
  
      Params:
        revealChild = true to reveal the child
  */
  void setRevealChild(bool revealChild)
  {
    gtk_revealer_set_reveal_child(cast(GtkRevealer*)this._cPtr, revealChild);
  }

  /**
      Sets the duration that transitions will take.
  
      Params:
        duration = the new duration, in milliseconds
  */
  void setTransitionDuration(uint duration)
  {
    gtk_revealer_set_transition_duration(cast(GtkRevealer*)this._cPtr, duration);
  }

  /**
      Sets the type of animation that will be used for
      transitions in revealer.
      
      Available types include various kinds of fades and slides.
  
      Params:
        transition = the new transition type
  */
  void setTransitionType(gtk.types.RevealerTransitionType transition)
  {
    gtk_revealer_set_transition_type(cast(GtkRevealer*)this._cPtr, transition);
  }
}
