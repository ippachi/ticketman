import reactHotToast, {
  Toaster as ReactHotToastToaster,
  ToasterProps as ReactHotToastToasterProps,
} from "react-hot-toast";

export const toast = (text: string) => {
  reactHotToast.custom(
    <div className="toast">
      <div className="alert alert-info">{text}</div>
    </div>
  );
};

export const Toaster = ({ position }: ToasterProps) => {
  return <ReactHotToastToaster position={position} />;
};

export type ToasterProps = ReactHotToastToasterProps;
