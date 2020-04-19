<?php

namespace App\Listeners;

use App\Criteria\Earnings\EarningOfRestaurantCriteria;
use App\Repositories\EarningRepository;

class UpdateOrderEarningTable
{
    /**
     * @var EarningRepository
     */
    private $earningRepository;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(EarningRepository $earningRepository)
    {
        //
        $this->earningRepository = $earningRepository;
    }

    /**
     * Handle the event.
     *
     * @param object $event
     * @return void
     */
    public function handle($event)
    {
        if ($event->order->payment->status == 'Paid') {
            $this->earningRepository->pushCriteria(new EarningOfRestaurantCriteria($event->order->foodOrders[0]->food->restaurant->id));

            $restaurant = $this->earningRepository->first();
            // test if order delivered to client
            $amount = 0;
            if (empty($restaurant)) {
                Flash::error('Restaurants not found');
            } else {
                foreach ($event->order->foodOrders as $foodOrder) {
                    $amount += $foodOrder['price'] * $foodOrder['quantity'];
                }
                $restaurant->total_orders++;
                $restaurant->restaurant->admin_commission;
                $restaurant->total_earning += $amount;
                $restaurant->admin_earning += ($restaurant->restaurant->admin_commission / 100) * $amount;
                $restaurant->restaurant_earning += ($amount - $restaurant->admin_earning);
                $restaurant->delivery_fee += $event->order->delivery_fee;
                $restaurant->tax += ($amount+$event->order->delivery_fee) * $event->order->tax / 100;
                $restaurant->save();
            }
        }
    }
}
