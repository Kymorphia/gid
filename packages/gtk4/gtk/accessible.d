/// Module for [Accessible] interface
module gtk.accessible;

public import gtk.accessible_iface_proxy;
import gid.gid;
import gobject.object;
import gobject.value;
import gtk.atcontext;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.accessible.Accessible] is an interface for describing UI elements for
    Assistive Technologies.
    
    Every accessible implementation has:
    
     $(LIST
        * a “role”, represented by a value of the [gtk.types.AccessibleRole] enumeration
        * an “attribute”, represented by a set of [gtk.types.AccessibleState],
          [gtk.types.AccessibleProperty] and [gtk.types.AccessibleRelation] values
     )
       
    The role cannot be changed after instantiating a [gtk.accessible.Accessible]
    implementation.
    
    The attributes are updated every time a UI element's state changes in
    a way that should be reflected by assistive technologies. For instance,
    if a [gtk.widget.Widget] visibility changes, the [gtk.types.AccessibleState.Hidden]
    state will also change to reflect the [gtk.widget.Widget.visible] property.
    
    Every accessible implementation is part of a tree of accessible objects.
    Normally, this tree corresponds to the widget tree, but can be customized
    by reimplementing the `vfunc@Gtk.Accessible.get_accessible_parent`,
    `vfunc@Gtk.Accessible.get_first_accessible_child` and
    `vfunc@Gtk.Accessible.get_next_accessible_sibling` virtual functions.
    Note that you can not create a top-level accessible object as of now,
    which means that you must always have a parent accessible object.
    Also note that when an accessible object does not correspond to a widget,
    and it has children, whose implementation you don't control,
    it is necessary to ensure the correct shape of the a11y tree
    by calling [gtk.accessible.Accessible.setAccessibleParent] and
    updating the sibling by [gtk.accessible.Accessible.updateNextAccessibleSibling].
*/
interface Accessible
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_get_type != &gidSymbolNotFound ? gtk_accessible_get_type() : cast(GType)0;
  }

  /**
      Get `accessibleRole` property.
      Returns: The accessible role of the given [gtk.accessible.Accessible] implementation.
        
        The accessible role cannot be changed once set.
  */
  @property gtk.types.AccessibleRole accessibleRole();

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role of the given [gtk.accessible.Accessible] implementation.
          
          The accessible role cannot be changed once set.
  */
  @property void accessibleRole(gtk.types.AccessibleRole propval);

  /**
      Requests the user's screen reader to announce the given message.
      
      This kind of notification is useful for messages that
      either have only a visual representation or that are not
      exposed visually at all, e.g. a notification about a
      successful operation.
      
      Also, by using this API, you can ensure that the message
      does not interrupts the user's current screen reader output.
  
      Params:
        message = the string to announce
        priority = the priority of the announcement
  */
  void announce(string message, gtk.types.AccessibleAnnouncementPriority priority);

  /**
      Retrieves the accessible parent for an accessible object.
      
      This function returns `NULL` for top level widgets.
      Returns: the accessible parent
  */
  gtk.accessible.Accessible getAccessibleParent();

  /**
      Retrieves the accessible role of an accessible object.
      Returns: the accessible role
  */
  gtk.types.AccessibleRole getAccessibleRole();

  /**
      Retrieves the accessible implementation for the given [gtk.accessible.Accessible].
      Returns: the accessible implementation object
  */
  gtk.atcontext.ATContext getAtContext();

  /**
      Queries the coordinates and dimensions of this accessible
      
      This functionality can be overridden by [gtk.accessible.Accessible]
      implementations, e.g. to get the bounds from an ignored
      child widget.
  
      Params:
        x = the x coordinate of the top left corner of the accessible
        y = the y coordinate of the top left corner of the widget
        width = the width of the accessible object
        height = the height of the accessible object
      Returns: true if the bounds are valid, and false otherwise
  */
  bool getBounds(out int x, out int y, out int width, out int height);

  /**
      Retrieves the first accessible child of an accessible object.
      Returns: the first accessible child
  */
  gtk.accessible.Accessible getFirstAccessibleChild();

  /**
      Retrieves the next accessible sibling of an accessible object
      Returns: the next accessible sibling
  */
  gtk.accessible.Accessible getNextAccessibleSibling();

  /**
      Query a platform state, such as focus.
      
      See gtk_accessible_platform_changed().
      
      This functionality can be overridden by [gtk.accessible.Accessible]
      implementations, e.g. to get platform state from an ignored
      child widget, as is the case for [gtk.text.Text] wrappers.
  
      Params:
        state = platform state to query
      Returns: the value of state for the accessible
  */
  bool getPlatformState(gtk.types.AccessiblePlatformState state);

  /**
      Resets the accessible property to its default value.
  
      Params:
        property = a [gtk.types.AccessibleProperty]
  */
  void resetProperty(gtk.types.AccessibleProperty property);

  /**
      Resets the accessible relation to its default value.
  
      Params:
        relation = a [gtk.types.AccessibleRelation]
  */
  void resetRelation(gtk.types.AccessibleRelation relation);

  /**
      Resets the accessible state to its default value.
  
      Params:
        state = a [gtk.types.AccessibleState]
  */
  void resetState(gtk.types.AccessibleState state);

  /**
      Sets the parent and sibling of an accessible object.
      
      This function is meant to be used by accessible implementations that are
      not part of the widget hierarchy, and but act as a logical bridge between
      widgets. For instance, if a widget creates an object that holds metadata
      for each child, and you want that object to implement the [gtk.accessible.Accessible]
      interface, you will use this function to ensure that the parent of each
      child widget is the metadata object, and the parent of each metadata
      object is the container widget.
  
      Params:
        parent = the parent accessible object
        nextSibling = the sibling accessible object
  */
  void setAccessibleParent(gtk.accessible.Accessible parent = null, gtk.accessible.Accessible nextSibling = null);

  /**
      Updates the next accessible sibling of self.
      
      That might be useful when a new child of a custom [gtk.accessible.Accessible]
      is created, and it needs to be linked to a previous child.
  
      Params:
        newSibling = the new next accessible sibling to set
  */
  void updateNextAccessibleSibling(gtk.accessible.Accessible newSibling = null);

  /**
      Updates an array of accessible properties.
      
      This function should be called by [gtk.widget.Widget] types whenever an accessible
      property change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        properties = an array of [gtk.types.AccessibleProperty]
        values = an array of `GValues`, one for each property
  */
  void updateProperty(gtk.types.AccessibleProperty[] properties, gobject.value.Value[] values);

  /**
      Updates an array of accessible relations.
      
      This function should be called by [gtk.widget.Widget] types whenever an accessible
      relation change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        relations = an array of [gtk.types.AccessibleRelation]
        values = an array of `GValues`, one for each relation
  */
  void updateRelation(gtk.types.AccessibleRelation[] relations, gobject.value.Value[] values);

  /**
      Updates an array of accessible states.
      
      This function should be called by [gtk.widget.Widget] types whenever an accessible
      state change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        states = an array of [gtk.types.AccessibleState]
        values = an array of `GValues`, one for each state
  */
  void updateState(gtk.types.AccessibleState[] states, gobject.value.Value[] values);
}
