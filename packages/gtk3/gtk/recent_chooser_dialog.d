/// Module for [RecentChooserDialog] class
module gtk.recent_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.recent_chooser;
import gtk.recent_chooser_mixin;
import gtk.types;

/**
    #GtkRecentChooserDialog is a dialog box suitable for displaying the recently
    used documents.  This widgets works by putting a #GtkRecentChooserWidget inside
    a #GtkDialog.  It exposes the #GtkRecentChooserIface interface, so you can use
    all the #GtkRecentChooser functions on the recent chooser dialog as well as
    those for #GtkDialog.
    
    Note that #GtkRecentChooserDialog does not have any methods of its own.
    Instead, you should use the functions that work on a #GtkRecentChooser.
    
    ## Typical usage ## {#gtkrecentchooser-typical-usage}
    
    In the simplest of cases, you can use the following code to use
    a #GtkRecentChooserDialog to select a recently used file:
    
    ```c
    GtkWidget *dialog;
    gint res;
    
    dialog = gtk_recent_chooser_dialog_new ("Recent Documents",
                                            parent_window,
                                            _("_Cancel"),
                                            GTK_RESPONSE_CANCEL,
                                            _("_Open"),
                                            GTK_RESPONSE_ACCEPT,
                                            NULL);
    
    res = gtk_dialog_run (GTK_DIALOG (dialog));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        GtkRecentInfo *info;
        GtkRecentChooser *chooser = GTK_RECENT_CHOOSER (dialog);
    
        info = gtk_recent_chooser_get_current_item (chooser);
        open_file (gtk_recent_info_get_uri (info));
        gtk_recent_info_unref (info);
      }
    
    gtk_widget_destroy (dialog);
    ```
    
    Recently used files are supported since GTK+ 2.10.
*/
class RecentChooserDialog : gtk.dialog.Dialog, gtk.recent_chooser.RecentChooser
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
    return cast(void function())gtk_recent_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_recent_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentChooserDialog self()
  {
    return this;
  }

  /**
      Get builder for [gtk.recent_chooser_dialog.RecentChooserDialog]
      Returns: New builder object
  */
  static RecentChooserDialogGidBuilder builder()
  {
    return new RecentChooserDialogGidBuilder;
  }

  mixin RecentChooserT!();
}

/// Fluent builder implementation template for [gtk.recent_chooser_dialog.RecentChooserDialog]
class RecentChooserDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T, gtk.recent_chooser.RecentChooserGidBuilderImpl!T
{

  mixin RecentChooserGidBuilderT!();
}

/// Fluent builder for [gtk.recent_chooser_dialog.RecentChooserDialog]
final class RecentChooserDialogGidBuilder : RecentChooserDialogGidBuilderImpl!RecentChooserDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecentChooserDialog build()
  {
    return new RecentChooserDialog(cast(void*)createGObject(RecentChooserDialog._getGType), No.Take);
  }
}
