/// Module for [AssistantPage] class
module gtk.assistant_page;

import gid.gid;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_assistant_page_get_type != &gidSymbolNotFound ? gtk_assistant_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AssistantPage self()
  {
    return this;
  }

  /**
      Get `complete` property.
      Returns: Whether all required fields are filled in.
        
        GTK uses this information to control the sensitivity
        of the navigation buttons.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property bool complete()
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
  @property void complete(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("complete", propval);
  }

  /**
      Get `pageType` property.
      Returns: The type of the assistant page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property gtk.types.AssistantPageType pageType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.AssistantPageType)("page-type");
  }

  /**
      Set `pageType` property.
      Params:
        propval = The type of the assistant page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void pageType(gtk.types.AssistantPageType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.AssistantPageType)("page-type", propval);
  }

  /**
      Get `title` property.
      Returns: The title of the page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property string title()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the page.
  
      Deprecated: This object will be removed in GTK 5
  */
  @property void title(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Returns the child to which page belongs.
      Returns: the child to which page belongs
  
      Deprecated: This widget will be removed in GTK 5
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_page_get_child(cast(GtkAssistantPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
