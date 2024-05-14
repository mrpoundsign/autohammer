import { AHQuickbar, IQuickbarSetHandler } from "../autohammer/quickbar";

class QuickbarNoSwap implements IQuickbarSetHandler {
  set(quickbarIndex: number, index: number, entityID: EntityID, curr: EntityID): boolean {
    if (entityID != INVALID_ENTITYID && curr != INVALID_ENTITYID) {
      return false;
    }
    return true;
  }
}

AHQuickbar.registerQuickbarSetHandler(new QuickbarNoSwap());