const express = require("express");
const {
  addNewTask,
  userTasks,
  catergorizer,
  searchResults,
} = require("../helperfuncs/helpfunctions");
const router = express.Router();

router.get("/", (req, res) => {
  userTasks(req.session.user_id).then((result) => {
    return res.json(result);
  });
});

router.post("/tasks", (req, res) => {
  console.log("req is : ", req);
  const task = req.body["$taskName"];
  const id = req.session.user_id;
  catergorizer(task)
    .then((response) => {
      return searchResults(response);
    })
    .then((category_id) => {
      console.log(`categorizer value is `, category_id);
      addNewTask(id, task, category_id).then((result) => {
        console.log("addnewtask ", result);
        res.json(result);
      });
    });
});

router.post("/:taskId", (req, res) => {});

router.put("/:taskid");

router.delete("/:taskId", (req, res) => {});

module.exports = router;
