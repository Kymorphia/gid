/// Module for [AssistantPage] class
module gtk.assistant_page;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.assistant_page.AssistantPage] is an auxiliary object used by `GtkAssistant.

    Deprecated: This object will be removed in GTK 5
*/
class AssistantPage : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_assistant_page_get_type != &gidSymbolNotFound ? gtk_assistant_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AssistantPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.assistant_page.AssistantPage]
      Returns: New builder object
  */
  static AssistantPageGidBuilder builder() nothrow
  {
    return new AssistantPageGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Get `complete` property.
      Returns: Whether all required fields are filled in.
        
        GTK uses this information to control the sensitivity
        of the navigation buttons.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property bool complete() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("complete");
  }

  /**
      Set `complete` property.
      Params:
        propval = Whether all required fields are filled in.
          
          GTK uses this information to control the sensitivity
          of the navigation buttons.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void complete(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("complete", propval);
  }

  /**
      Get `pageType` property.
      Returns: The type of the assistant page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property gtk.types.AssistantPageType pageType() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.AssistantPageType)("page-type");
  }

  /**
      Set `pageType` property.
      Params:
        propval = The type of the assistant page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void pageType(gtk.types.AssistantPageType propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.AssistantPageType)("page-type", propval);
  }

  /**
      Get `title` property.
      Returns: The title of the page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property string title() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void title(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Returns the child to which page belongs.
      Returns: the child to which page belongs
  
      Deprecated: This widget will be removed in GTK 5
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_page_get_child(cast(GtkAssistantPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.assistant_page.AssistantPage]
class AssistantPageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This object will be removed in GTK 5
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `complete` property.
      Params:
        propval = Whether all required fields are filled in.
          
          GTK uses this information to control the sensitivity
          of the navigation buttons.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This object will be removed in GTK 5
  */
  T complete(bool propval) nothrow
  {
    return setProperty("complete", propval);
  }

  /**
      Set `pageType` property.
      Params:
        propval = The type of the assistant page.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This object will be removed in GTK 5
  */
  T pageType(gtk.types.AssistantPageType propval) nothrow
  {
    return setProperty("page-type", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the page.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This object will be removed in GTK 5
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gtk.assistant_page.AssistantPage]
final class AssistantPageGidBuilder : AssistantPageGidBuilderImpl!AssistantPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AssistantPage build() nothrow
  {
    return new AssistantPage(cast(void*)createGObject(AssistantPage._getGType), No.Take);
  }
}
