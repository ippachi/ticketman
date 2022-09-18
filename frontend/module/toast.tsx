import reactHotToast, {Toaster as ReactHotToastToaster, ToasterProps as ReactHotToastToasterProps} from "react-hot-toast";

export const toast = (node: JSX.Element) => reactHotToast.custom(node)

export const Toaster = ({position}: ToasterProps) => {
  return <ReactHotToastToaster position={position} />
}

export type ToasterProps = ReactHotToastToasterProps
