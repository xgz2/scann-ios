module.exports = {
  categories: async function (req, res) {
    try {
      const categories = await Category.find().populate("items");
      res.send(categories);
    } catch (err) {
      res.serverError(err.toString());
    }
  },

  create: async function (req, res) {
    const name = req.body.name;

    try {
      await Category.create({
        name: name,
      });
      console.log("Finished creating object");
      res.end();
    } catch (err) {
      return res.serverError(err.toString());
    }
  },

  // findById: function (req, res) {
  //   const itemId = req.param("itemId");

  //   const filteredItems = allItems.filter((i) => {
  //     return i.id == itemId;
  //   });
  //   if (filteredItems.length > 0) {
  //     res.send(filteredItems[0]);
  //   } else {
  //     res.send("failure");
  //   }
  // },

  delete: async function (req, res) {
    const categoryId = req.param("categoryId");

    await Category.destroy({ id: categoryId });
    res.send("Deleted Category");
  },
};
