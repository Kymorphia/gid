/// Module for [BindingSet] class
module gtk.binding_set;

import gdk.types;
import gid.gid;
import gobject.object;
import gtk.binding_entry;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A binding set maintains a list of activatable key bindings.
    A single binding set can match multiple types of widgets.
    Similar to style contexts, can be matched by any information contained
    in a widgets #GtkWidgetPath. When a binding within a set is matched upon
    activation, an action signal is emitted on the target widget to carry out
    the actual activation.
*/
class BindingSet
{
  GtkBindingSet cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.binding_set.BindingSet");

    cInstance = *cast(GtkBindingSet*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `setName` field.
      Returns: unique name of this binding set
  */
  @property string setName()
  {
    return cToD!(string)(cast(void*)(cast(GtkBindingSet*)this._cPtr).setName);
  }

  /**
      Set `setName` field.
      Params:
        propval = unique name of this binding set
  */
  @property void setName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkBindingSet*)this._cPtr).setName);
    dToC(propval, cast(void*)&(cast(GtkBindingSet*)this._cPtr).setName);
  }

  /**
      Get `priority` field.
      Returns: unused
  */
  @property int priority()
  {
    return (cast(GtkBindingSet*)this._cPtr).priority;
  }

  /**
      Set `priority` field.
      Params:
        propval = unused
  */
  @property void priority(int propval)
  {
    (cast(GtkBindingSet*)this._cPtr).priority = propval;
  }

  /**
      Get `entries` field.
      Returns: the key binding entries in this binding set
  */
  @property gtk.binding_entry.BindingEntry entries()
  {
    return new gtk.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingSet*)this._cPtr).entries, No.Take);
  }

  /**
      Get `current` field.
      Returns: implementation detail
  */
  @property gtk.binding_entry.BindingEntry current()
  {
    return new gtk.binding_entry.BindingEntry(cast(GtkBindingEntry*)(cast(GtkBindingSet*)this._cPtr).current, No.Take);
  }

  /**
      Get `parsed` field.
      Returns: whether this binding set stems from a CSS file and is reset upon theme changes
  */
  @property uint parsed()
  {
    return (cast(GtkBindingSet*)this._cPtr).parsed;
  }

  /**
      Set `parsed` field.
      Params:
        propval = whether this binding set stems from a CSS file and is reset upon theme changes
  */
  @property void parsed(uint propval)
  {
    (cast(GtkBindingSet*)this._cPtr).parsed = propval;
  }

  /**
      Find a key binding matching keyval and modifiers within
      binding_set and activate the binding on object.
  
      Params:
        keyval = key value of the binding
        modifiers = key modifier of the binding
        object = object to activate when binding found
      Returns: true if a binding was found and activated
  */
  bool activate(uint keyval, gdk.types.ModifierType modifiers, gobject.object.ObjectWrap object)
  {
    bool _retval;
    _retval = cast(bool)gtk_binding_set_activate(cast(GtkBindingSet*)this._cPtr, keyval, modifiers, object ? cast(GObject*)object._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function was used internally by the GtkRC parsing mechanism
      to assign match patterns to #GtkBindingSet structures.
      
      In GTK+ 3, these match patterns are unused.
  
      Params:
        pathType = path type the pattern applies to
        pathPattern = the actual match pattern
        priority = binding priority
  */
  void addPath(gtk.types.PathType pathType, string pathPattern, gtk.types.PathPriorityType priority)
  {
    const(char)* _pathPattern = pathPattern.toCString(No.Alloc);
    gtk_binding_set_add_path(cast(GtkBindingSet*)this._cPtr, pathType, _pathPattern, priority);
  }

  /**
      Find a binding set by its globally unique name.
      
      The set_name can either be a name used for [gtk.binding_set.BindingSet.new_]
      or the type name of a class used in [gtk.binding_set.BindingSet.byClass].
  
      Params:
        setName = unique binding set name
      Returns: null or the specified binding set
  */
  static gtk.binding_set.BindingSet find(string setName)
  {
    GtkBindingSet* _cretval;
    const(char)* _setName = setName.toCString(No.Alloc);
    _cretval = gtk_binding_set_find(_setName);
    auto _retval = _cretval ? new gtk.binding_set.BindingSet(cast(GtkBindingSet*)_cretval, No.Take) : null;
    return _retval;
  }
}
