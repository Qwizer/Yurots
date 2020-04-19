<?php

namespace App\Http\Controllers\API;


use App\Http\Requests\CreateCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Models\Category;
use App\Repositories\CategoryRepository;
use App\Repositories\CustomFieldRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Prettus\Validator\Exceptions\ValidatorException;

/**
 * Class CategoryController
 * @package App\Http\Controllers\API
 */

class CategoryAPIController extends Controller
{
    /** @var  CategoryRepository */
    private $categoryRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(CategoryRepository $categoryRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->categoryRepository = $categoryRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
    }

    /**
     * Display a listing of the Category.
     * GET|HEAD /categories
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->categoryRepository->pushCriteria(new RequestCriteria($request));
            $this->categoryRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $categories = $this->categoryRepository->all();

        return $this->sendResponse($categories->toArray(), 'Categories retrieved successfully');
    }

    /**
     * Display the specified Category.
     * GET|HEAD /categories/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Category $category */
        if (!empty($this->categoryRepository)) {
            $category = $this->categoryRepository->findWithoutFail($id);
        }

        if (empty($category)) {
            return $this->sendError('Category not found');
        }

        return $this->sendResponse($category->toArray(), 'Category retrieved successfully');
    }

    /**
     * Store a newly created Category in storage.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->categoryRepository->model());
        try {
            $category = $this->categoryRepository->create($input);
            $category->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($category, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        return $this->sendResponse($category->toArray(), __('lang.saved_successfully',['operator' => __('lang.category')]));
    }

    /**
     * Update the specified Category in storage.
     *
     * @param int $id
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update($id, Request $request)
    {
        $category = $this->categoryRepository->findWithoutFail($id);

        if (empty($category)) {
            return $this->sendError('Category not found');
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->categoryRepository->model());
        try {
            $category = $this->categoryRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($category, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $category->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            return $this->sendError($e->getMessage());
        }

        return $this->sendResponse($category->toArray(), __('lang.updated_successfully',['operator' => __('lang.category')]));

    }

    /**
     * Remove the specified Category from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $category = $this->categoryRepository->findWithoutFail($id);

        if (empty($category)) {
            return $this->sendError('Category not found');
        }

        $category = $this->categoryRepository->delete($id);

        return $this->sendResponse($category, __('lang.deleted_successfully',['operator' => __('lang.category')]));
    }
}
