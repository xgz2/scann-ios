/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

module.exports.routes = {
  /***************************************************************************
   *                                                                          *
   * Make the view located at `views/homepage.ejs` your home page.            *
   *                                                                          *
   * (Alternatively, remove this and add an `index.html` file in your         *
   * `assets` directory)                                                      *
   *                                                                          *
   ***************************************************************************/

  "/": { view: "pages/homepage" },

  "/items": "ItemsController.items",
  "GET /items/:itemId": "ItemsController.findById",
  "POST /items": "item/create",
  "DELETE /items/:itemId": "ItemsController.delete",
  "DELETE /items": "ItemsController.destroyAll",

  "/categories": "CategoriesController.categories",
  "GET /categories/:categoryId": "CategoryController.findById",
  "POST /categories": "CategoriesController.create",
  "DELETE /categories/:categoryId": "CategoriesController.delete",
  "DELETE /categories": "CategoriesController.destroyAll",
  /***************************************************************************
   *                                                                          *
   * More custom routes here...                                               *
   * (See https://sailsjs.com/config/routes for examples.)                    *
   *                                                                          *
   * If a request to a URL doesn't match any of the routes in this file, it   *
   * is matched against "shadow routes" (e.g. blueprint routes).  If it does  *
   * not match any of those, it is matched against static assets.             *
   *                                                                          *
   ***************************************************************************/
};
