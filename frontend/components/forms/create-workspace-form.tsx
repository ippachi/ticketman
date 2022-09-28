import { useForm } from "react-hook-form";
import * as yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import { CreateWorkspaceMutationVariables } from "../../src/generated/graphql";
import FormControl from "../form/form-control";
import Button from "../button";
import InputWithLabel from "../form/input-with-label";

const schema = yup
  .object({
    id: yup.string().min(3).max(32).matches(new RegExp("^[a-z][a-z0-9_]+$")).required(),
    name: yup.string().required(),
  })
  .required();

export default function CreateworkspaceForm({
  onSubmit,
}: {
  onSubmit: (data: CreateWorkspaceMutationVariables) => void;
}): JSX.Element {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({ resolver: yupResolver(schema), defaultValues: { id: "", name: "" } });

  return (
    // eslint-disable-next-line @typescript-eslint/no-misused-promises
    <form onSubmit={handleSubmit(onSubmit)}>
      <FormControl>
        <InputWithLabel label="ID" error={errors.id} {...register("id")} />
        <label className="label">
          <span className="label-text-alt">
            * ID must be between 3 and 32 characters and consist of alphanumeric characters and underscores
          </span>
        </label>
      </FormControl>

      <FormControl>
        <InputWithLabel label="Name" error={errors.name} {...register("name")} />
      </FormControl>

      <div className="mt-4">
        <Button type="submit">Submit</Button>
      </div>
    </form>
  );
}