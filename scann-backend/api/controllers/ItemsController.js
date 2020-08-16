// const banana = {
//   id: 1,
//   name: "banana",
//   category: "produce",
//   imageName: "bananaImage",
//   expiration: "2013-07-21T19:32:00Z",
// };

// const porkTenderloin = {
//   id: 2,
//   name: "pork tenderloin",
//   category: "meat and fish",
//   imageName: "porkTenderloinImage",
//   expiration: "2013-07-21T19:32:00Z",
// };

// const allItems = [banana, porkTenderloin];

module.exports = {
  items: async function (req, res) {
    try {
      const items = await Item.find();
      res.send(items);
    } catch (err) {
      res.serverError(err.toString());
    }
  },

  // create: async function (req, res) {
  //   const name = req.body.name;
  //   const imageName = req.body.imageName;
  //   const expiration = req.body.expiration;
  //   const category = req.body.category;

  //   try {
  //     await Item.create({
  //       name: name,
  //       imageName: imageName,
  //       expiration: expiration,

  //       category: category,
  //     });
  //     console.log("Finished creating object");
  //     res.end();
  //   } catch (err) {
  //     return res.serverError(err.toString());
  //   }
  // },

  findById: function (req, res) {
    const itemId = req.param("itemId");

    const filteredItems = allItems.filter((i) => {
      return i.id == itemId;
    });
    if (filteredItems.length > 0) {
      res.send(filteredItems[0]);
    } else {
      res.send("failure");
    }
  },

  delete: async function (req, res) {
    const itemId = req.param("itemId");

    await Item.destroy({ id: itemId });
    res.send("Deleted post");
  },

  destroyAll: async function (req, res) {
    try {
      await Item.destroy({});
      console.log("All items destroyed.");
      res.end();
    } catch (err) {
      return res.serverError(err.toString());
    }
  },
};
