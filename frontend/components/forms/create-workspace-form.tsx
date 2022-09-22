import { useForm } from "react-hook-form";
import Button from "../../components/button";
import { FormControl } from "../../components/form";
import * as yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import InputWithLabel from "../../components/form/input-with-label";
import { CreateWorkspaceMutationVariables } from "../../src/generated/graphql";

const schema = yup
  .object({
    id: yup.string().min(3).max(16).matches(new RegExp("^[a-z][a-z0-9_]+$")).required(),
    name: yup.string().required(),
  })
  .required();

export default function CreateworkspaceForm({
  onSubmit,
}: {
  onSubmit: (data: CreateWorkspaceMutationVariables) => void;
}) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({ resolver: yupResolver(schema), defaultValues: { id: "", name: "" } });

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <FormControl>
        <InputWithLabel label="ID" error={errors.id} {...register("id")} />
        <label className="label">
          <span className="label-text-alt">
            * ID must be between 3 and 16 characters and consist of alphanumeric characters and underscores
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
