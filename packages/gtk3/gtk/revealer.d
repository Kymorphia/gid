/// Module for [Revealer] class
module gtk.revealer;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The GtkRevealer widget is a container which animates
    the transition of its child from invisible to visible.
    
    The style of transition can be controlled with
    [gtk.revealer.Revealer.setTransitionType].
    
    These animations respect the #GtkSettings:gtk-enable-animations
    setting.
    
    # CSS nodes
    
    GtkRevealer has a single CSS node with name revealer.
    
    The GtkRevealer widget was added in GTK+ 3.10.
*/
class Revealer : gtk.bin.Bin
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

  /** */
  @property bool childRevealed()
  {
    return getChildRevealed();
  }

  /** */
  @property bool revealChild()
  {
    return getRevealChild();
  }

  /** */
  @property void revealChild(bool propval)
  {
    return setRevealChild(propval);
  }

  /** */
  @property uint transitionDuration()
  {
    return getTransitionDuration();
  }

  /** */
  @property void transitionDuration(uint propval)
  {
    return setTransitionDuration(propval);
  }

  /** */
  @property gtk.types.RevealerTransitionType transitionType()
  {
    return getTransitionType();
  }

  /** */
  @property void transitionType(gtk.types.RevealerTransitionType propval)
  {
    return setTransitionType(propval);
  }

  /**
      Creates a new #GtkRevealer.
      Returns: a newly created #GtkRevealer
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_revealer_new();
    this(_cretval, No.Take);
  }

  /**
      Returns whether the child is fully revealed, in other words whether
      the transition to the revealed state is completed.
      Returns: true if the child is fully revealed
  */
  bool getChildRevealed()
  {
    bool _retval;
    _retval = cast(bool)gtk_revealer_get_child_revealed(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently
      revealed. See [gtk.revealer.Revealer.setRevealChild].
      
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
      Tells the #GtkRevealer to reveal or conceal its child.
      
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
      transitions in revealer. Available types include
      various kinds of fades and slides.
  
      Params:
        transition = the new transition type
  */
  void setTransitionType(gtk.types.RevealerTransitionType transition)
  {
    gtk_revealer_set_transition_type(cast(GtkRevealer*)this._cPtr, transition);
  }
}
