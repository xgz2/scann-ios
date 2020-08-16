module.exports = {
  friendlyName: "Create",

  description: "Create item.",

  inputs: {
    name: {
      type: "string",
      required: true,
    },
  },

  exits: {},

  fn: async function (inputs) {
    // All done.
    return;
  },
};
