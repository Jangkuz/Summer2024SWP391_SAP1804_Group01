import { useCartStore } from "../../../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import ChooseItemDiamond from "./ChooseItemDiamond";
import ChooseItemAccessory from "./ChooseItemAccessory";
import ChooseItemComplete from "./ChooseItemComplete";

export default function ChooseItem() {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  const [diamond, accessory, diamondPrice, materialPrice] = useQueries({
    queries: [
      {
        queryKey: ["currentDiamond", currentDiamond],
        queryFn: () => GET(`/api/Diamonds/${currentDiamond}`),
        staleTime: Infinity,
      },
      {
        queryKey: ["currentAccessory", currentAccessory],
        queryFn: () => GET(`/api/Accessories/${currentAccessory}`),
        staleTime: Infinity,
      },
      {
        queryKey: ["diamondPrice"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["materialPrice"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
    ],
  });
  const diamondPriceItem =
    diamond?.data && diamondPrice?.data
      ? diamondPrice.data.find(
          (price: any) =>
            diamond.data.color == price.color &&
            diamond.data.clarity == price.clarity &&
            price.minCaratEff <= diamond.data.carat &&
            diamond.data.carat <= price.maxCaratEff
        )
      : undefined;
  const diamondUnitPrice = diamondPriceItem ? diamondPriceItem.unitPrice : 0;

  const materialPriceItem =
    accessory?.data && materialPrice.data
      ? materialPrice.data.find(
          (price: any) => price.karat == accessory.data.karat
        )
      : undefined;
  const materialUnitPrice = materialPriceItem ? materialPriceItem.unitPrice : 0;

  return (
    <div id="choose-item" className="flex mulish-regular">
      {diamond?.data &&
        diamondPrice?.data &&
        accessory?.data &&
        materialPrice?.data && (
          <>
            <ChooseItemDiamond
              diamond={diamond?.data}
              price={(
                diamondUnitPrice *
                diamond.data.carat *
                10
              ).toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            />
            <ChooseItemAccessory
              accessory={accessory.data}
              price={(materialUnitPrice * accessory.data.karat).toLocaleString(
                "en-US",
                {
                  style: "currency",
                  currency: "USD",
                  maximumFractionDigits: 0,
                }
              )}
            />
            <ChooseItemComplete
              accessory={accessory?.data}
              totalPrice={(
                diamondUnitPrice * diamond.data.carat * 10 +
                materialUnitPrice * accessory.data.karat
              ).toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            />
          </>
        )}
    </div>
  );
}
