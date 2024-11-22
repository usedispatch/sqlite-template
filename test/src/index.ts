import aos from "./aos";
import fs from "fs";
import path from "node:path";
import assert from "node:assert";
import { describe, test, before } from "node:test";

describe("Tests", () => {
  let env: aos;

  before(async () => {
    const source = fs.readFileSync(
      path.join(__dirname, "../../process/build/output.lua"),
      "utf-8"
    );
    env = new aos(source);
    await env.init();
  });

  test("should add and get todo", async () => {
    const todo = {
      id: "1",
      title: "Test Todo",
      completed: false,
    };

    const response = await env.send({
      Action: "AddTodo",
      Data: JSON.stringify(todo),
    });

    console.log("add todo", response.Messages);
    // const response = await env.send({ Action: "GetTodos" });
    // const todos = JSON.parse(response.Messages[0].Data);
    // assert.deepEqual(todos[0], todo);
  });

  test("should get todos", async () => {
    const response = await env.send({ Action: "GetTodos" });
    console.log(response.Messages);
  });
});
