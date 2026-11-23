/// Module for [AssistantPage] class
module gid.gtk4.assistant_page;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    [gid.gtk4.assistant_page.AssistantPage] is an auxiliary object used by [gid.gtk4.assistant.Assistant].

    Deprecated: This object will be removed in GTK 5
*/
class AssistantPage : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_assistant_page_get_type != &gidSymbolNotFound ? gtk_assistant_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAssistantPage";
  }

  /** Returns `this`, for use in `with` statements. */
  override AssistantPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.assistant_page.AssistantPage]
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
  @property gid.gtk4.widget.Widget child() nothrow
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
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("complete");
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
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("complete", propval);
  }

  /**
      Get `pageType` property.
      Returns: The type of the assistant page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property gid.gtk4.types.AssistantPageType pageType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.AssistantPageType)("page-type");
  }

  /**
      Set `pageType` property.
      Params:
        propval = The type of the assistant page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void pageType(gid.gtk4.types.AssistantPageType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.AssistantPageType)("page-type", propval);
  }

  /**
      Get `title` property.
      Returns: The title of the page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Returns the child to which page belongs.
      Returns: the child to which page belongs
  
      Deprecated: This widget will be removed in GTK 5
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_page_get_child(cast(GtkAssistantPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.assistant_page.AssistantPage]
class AssistantPageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This object will be removed in GTK 5
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
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
  T pageType(gid.gtk4.types.AssistantPageType propval) nothrow
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

/// Fluent builder for [gid.gtk4.assistant_page.AssistantPage]
final class AssistantPageGidBuilder : AssistantPageGidBuilderImpl!AssistantPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AssistantPage build() nothrow
  {
    return new AssistantPage(cast(void*)createGObject(AssistantPage._getGType), Yes.Take);
  }
}
