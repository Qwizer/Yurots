<?php

namespace App\Criteria\Users;

use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class DriversOfRestaurantCriteria.
 *
 * @package namespace App\Criteria\Users;
 */
class DriversOfRestaurantCriteria implements CriteriaInterface
{
    private $restaurantId;

    /**
     * DriversOfRestaurantCriteria constructor.
     */
    public function __construct(int $restaurantId)
    {
        $this->restaurantId = $restaurantId;
    }

    /**
     * Apply criteria in query repository
     *
     * @param string              $model
     * @param RepositoryInterface $repository
     *
     * @return mixed
     */
    public function apply($model, RepositoryInterface $repository)
    {
        return $model->join('driver_restaurants','users.id','=','driver_restaurants.user_id')
            ->where('driver_restaurants.restaurant_id',$this->restaurantId);
    }
}
