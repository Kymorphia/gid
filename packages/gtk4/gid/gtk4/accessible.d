/// Module for [Accessible] interface
module gid.gtk4.accessible;

public import gid.core.basictypes;
public import gid.gtk4.accessible_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;
import gid.gtk4.atcontext;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface for describing UI elements for Assistive Technologies.
    
    Every accessible implementation has:
    
     - a “role”, represented by a value of the [gid.gtk4.types.AccessibleRole] enumeration
     - “attributes”, represented by a set of [gid.gtk4.types.AccessibleState],
       [gid.gtk4.types.AccessibleProperty] and [gid.gtk4.types.AccessibleRelation] values
    
    The role cannot be changed after instantiating a [gid.gtk4.accessible.Accessible]
    implementation.
    
    The attributes are updated every time a UI element's state changes in
    a way that should be reflected by assistive technologies. For instance,
    if a [gid.gtk4.widget.Widget] visibility changes, the [gid.gtk4.types.AccessibleState.Hidden]
    state will also change to reflect the [gid.gtk4.widget.Widget.visible] property.
    
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
    by calling [gid.gtk4.accessible.Accessible.setAccessibleParent] and
    updating the sibling by [gid.gtk4.accessible.Accessible.updateNextAccessibleSibling].
*/
interface Accessible : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_get_type != &gidSymbolNotFound ? gtk_accessible_get_type() : cast(GType)0;
  }

  /**
      Get `accessibleRole` property.
      Returns: The accessible role of the given [gid.gtk4.accessible.Accessible] implementation.
        
        The accessible role cannot be changed once set.
  */
  @property gid.gtk4.types.AccessibleRole accessibleRole() nothrow;

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role of the given [gid.gtk4.accessible.Accessible] implementation.
          
          The accessible role cannot be changed once set.
  */
  @property void accessibleRole(gid.gtk4.types.AccessibleRole propval) nothrow;

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
  void announce(string message, gid.gtk4.types.AccessibleAnnouncementPriority priority);

  /**
      Retrieves the accessible identifier for the accessible object.
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations.
      
      It is left to the accessible implementation to define the scope
      and uniqueness of the identifier.
      Returns: the accessible identifier
  */
  string getAccessibleId();

  /**
      Retrieves the accessible parent for an accessible object.
      
      This function returns `NULL` for top level widgets.
      Returns: the accessible parent
  */
  gid.gtk4.accessible.Accessible getAccessibleParent();

  /**
      Retrieves the accessible role of an accessible object.
      Returns: the accessible role
  */
  gid.gtk4.types.AccessibleRole getAccessibleRole();

  /**
      Retrieves the implementation for the given accessible object.
      Returns: the accessible implementation object
  */
  gid.gtk4.atcontext.ATContext getAtContext();

  /**
      Queries the coordinates and dimensions of this accessible
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
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
  gid.gtk4.accessible.Accessible getFirstAccessibleChild();

  /**
      Retrieves the next accessible sibling of an accessible object
      Returns: the next accessible sibling
  */
  gid.gtk4.accessible.Accessible getNextAccessibleSibling();

  /**
      Queries a platform state, such as focus.
      
      This functionality can be overridden by [gid.gtk4.accessible.Accessible]
      implementations, e.g. to get platform state from an ignored
      child widget, as is the case for [gid.gtk4.text.Text] wrappers.
  
      Params:
        state = platform state to query
      Returns: the value of state for the accessible
  */
  bool getPlatformState(gid.gtk4.types.AccessiblePlatformState state);

  /**
      Resets the accessible property to its default value.
  
      Params:
        property = the accessible property
  */
  void resetProperty(gid.gtk4.types.AccessibleProperty property);

  /**
      Resets the accessible relation to its default value.
  
      Params:
        relation = the accessible relation
  */
  void resetRelation(gid.gtk4.types.AccessibleRelation relation);

  /**
      Resets the accessible state to its default value.
  
      Params:
        state = the accessible state
  */
  void resetState(gid.gtk4.types.AccessibleState state);

  /**
      Sets the parent and sibling of an accessible object.
      
      This function is meant to be used by accessible implementations that are
      not part of the widget hierarchy, and but act as a logical bridge between
      widgets. For instance, if a widget creates an object that holds metadata
      for each child, and you want that object to implement the [gid.gtk4.accessible.Accessible]
      interface, you will use this function to ensure that the parent of each
      child widget is the metadata object, and the parent of each metadata
      object is the container widget.
  
      Params:
        parent = the parent accessible object
        nextSibling = the sibling accessible object
  */
  void setAccessibleParent(gid.gtk4.accessible.Accessible parent = null, gid.gtk4.accessible.Accessible nextSibling = null);

  /**
      Updates the next accessible sibling.
      
      That might be useful when a new child of a custom accessible
      is created, and it needs to be linked to a previous child.
  
      Params:
        newSibling = the new next accessible sibling to set
  */
  void updateNextAccessibleSibling(gid.gtk4.accessible.Accessible newSibling = null);

  /**
      Informs ATs that the platform state has changed.
      
      This function should be used by [gid.gtk4.accessible.Accessible] implementations that
      have a platform state but are not widgets. Widgets handle platform
      states automatically.
  
      Params:
        state = the platform state to update
  */
  void updatePlatformState(gid.gtk4.types.AccessiblePlatformState state);

  /**
      Updates an array of accessible properties.
      
      This function should be called by [gid.gtk4.widget.Widget] types whenever an accessible
      property change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        properties = an array of accessible properties
        values = an array of `GValues`, one for each property
  */
  void updateProperty(gid.gtk4.types.AccessibleProperty[] properties, gid.gobject2.value.Value[] values);

  /**
      Updates an array of accessible relations.
      
      This function should be called by [gid.gtk4.widget.Widget] types whenever an accessible
      relation change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        relations = an array of accessible relations
        values = an array of `GValues`, one for each relation
  */
  void updateRelation(gid.gtk4.types.AccessibleRelation[] relations, gid.gobject2.value.Value[] values);

  /**
      Updates an array of accessible states.
      
      This function should be called by [gid.gtk4.widget.Widget] types whenever an accessible
      state change must be communicated to assistive technologies.
      
      This function is meant to be used by language bindings.
  
      Params:
        states = an array of accessible states
        values = an array of `GValues`, one for each state
  */
  void updateState(gid.gtk4.types.AccessibleState[] states, gid.gobject2.value.Value[] values);
}

/// Fluent builder implementation template for [gid.gtk4.accessible.Accessible]
interface AccessibleGidBuilderImpl(T)
{

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role of the given [gid.gtk4.accessible.Accessible] implementation.
          
          The accessible role cannot be changed once set.
      Returns: Builder instance for fluent chaining
  */
  T accessibleRole(gid.gtk4.types.AccessibleRole propval) nothrow;
}
